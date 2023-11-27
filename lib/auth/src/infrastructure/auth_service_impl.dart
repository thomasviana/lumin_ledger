import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:lumin_ledger/auth/domain.dart';
import 'package:lumin_ledger/user/domain.dart';

@LazySingleton(as: AuthService)
class AuthServiceImpl implements AuthService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthServiceImpl(
    this._firebaseAuth,
    this._googleSignIn,
  );

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(AuthFailure.cancelledByUser);
      }
      final googleAuthentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );
      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((value) => right(unit));
    } on FirebaseAuthException catch (_) {
      return left(AuthFailure.serverError);
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> createUserWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressString = emailAddress.value;
    final passwordString = password.value;
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressString,
        password: passwordString,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      // Seems that there is a problem with FirebaseAuthException
      switch (e.code) {
        case 'email-already-in-use':
          return left(AuthFailure.emailAlreadyInUser);
        default:
          return left(AuthFailure.serverError);
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressString = emailAddress.value;
    final passwordString = password.value;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddressString,
        password: passwordString,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'wrong-password':
          return left(AuthFailure.invalidEmailAndPasswordCombination);
        case 'user-not-found':
          return left(AuthFailure.userNotFound);
        default:
          return left(AuthFailure.serverError);
      }
    }
  }

  @override
  Future<void> logOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  @override
  Stream<bool> checkAuthStatus() {
    return FirebaseAuth.instance
        .authStateChanges()
        .map((User? user) => user != null);
  }
}
