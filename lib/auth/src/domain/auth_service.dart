import 'package:fpdart/fpdart.dart';
import 'package:lumin_ledger/user/src/domain/vo/email_address.dart';
import 'package:lumin_ledger/user/src/domain/vo/password.dart';

import 'auth_failure.dart';

abstract class AuthService {
  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<Either<AuthFailure, Unit>> createUserWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<void> logOut();

  Stream<bool> checkAuthStatus();
}
