import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:lumin_ledger/auth/domain.dart';
import 'package:lumin_ledger/user/domain.dart';

@injectable
class CreateUser {
  final AuthService _authService;

  const CreateUser(this._authService);

  Future<Either<AuthFailure, Unit>> call(
    EmailAddress email,
    Password password,
  ) =>
      _authService.createUserWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );
}
