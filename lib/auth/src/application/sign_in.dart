import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:lumin_ledger/auth/domain.dart';
import 'package:lumin_ledger/user/domain.dart';

@injectable
class SignIn {
  final AuthService _authService;

  const SignIn(this._authService);

  Future<Either<AuthFailure, Unit>> withGoogle() =>
      _authService.signInWithGoogle();

  Future<Either<AuthFailure, Unit>> withEmailAndPassword(
    EmailAddress email,
    Password password,
  ) =>
      _authService.signInWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );
}
