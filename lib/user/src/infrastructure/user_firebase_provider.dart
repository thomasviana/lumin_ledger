import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:lumin_ledger/app/constants/constants.dart';
import 'package:lumin_ledger/user/domain.dart';
import 'package:path/path.dart' as path;

import 'user_entity_dto.dart';

@lazySingleton
class UserFirebaseProvider {
  final FirebaseStorage _firebaseStorage;
  final FirebaseFirestore _firebaseFirestore;

  UserFirebaseProvider(
    this._firebaseStorage,
    this._firebaseFirestore,
  );

  User? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('Not authenticated exception.');
    return user;
  }

  Stream<Option<UserEntity>> getUser() async* {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      yield const None();
    } else {
      yield* _firebaseFirestore
          .doc('users/${user.uid}')
          .snapshots()
          .map((snapshot) {
        if (snapshot.exists) {
          final userData = UserEntityDTO.fromFirebaseMap(snapshot.data()!);
          final userEntity = userData.toDomain();
          return Some(userEntity);
        } else {
          final registeredUser = _userFromFirebase(user);
          return Some(registeredUser);
        }
      });
    }
  }

  UserEntity _userFromFirebase(User user) {
    return UserEntity(
      id: user.uid,
      name: user.displayName ?? '',
      emailAddress: EmailAddress(user.email!),
      phoneNumber: PhoneNumber(user.phoneNumber ?? ''),
      photoUrl: user.photoURL ?? kDefaultPhotoUrl,
    );
  }

  Future<void> saveUser(UserEntity user) async {
    final ref = _firebaseFirestore.doc('users/${currentUser!.uid}');
    final userDTO = UserEntityDTO.fromDomain(user);
    if (user.imagePath == null) {
      await ref.set(userDTO.toFirebaseMap(), SetOptions(merge: true));
    } else {
      final imagePath =
          '${currentUser!.uid}/profile/${path.basename(user.imagePath!)}';
      final storageRef = _firebaseStorage.ref(imagePath);
      await storageRef.putFile(File(user.imagePath!));
      final url = await storageRef.getDownloadURL();
      await ref.set(
        userDTO.toFirebaseMap(newImage: url),
        SetOptions(merge: true),
      );
    }
  }
}
