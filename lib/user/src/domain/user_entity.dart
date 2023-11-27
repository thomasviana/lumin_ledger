import 'package:equatable/equatable.dart';

import 'vo/email_address.dart';
import 'vo/phone_number.dart';

class UserEntity extends Equatable {
  final String id;
  final EmailAddress emailAddress;
  final String name;
  final PhoneNumber? phoneNumber;
  final String? imagePath;
  final String? photoUrl;

  const UserEntity({
    required this.id,
    required this.emailAddress,
    required this.name,
    this.phoneNumber,
    this.imagePath,
    this.photoUrl,
  });

  @override
  List<Object?> get props => [
        id,
        emailAddress,
        name,
        phoneNumber,
        imagePath,
        photoUrl,
      ];

  UserEntity copyWith({
    EmailAddress? emailAddress,
    String? name,
    PhoneNumber? phoneNumber,
    String? imagePath,
    String? photoUrl,
  }) {
    return UserEntity(
      id: id,
      emailAddress: emailAddress ?? this.emailAddress,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      imagePath: imagePath ?? this.imagePath,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
