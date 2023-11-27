import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:lumin_ledger/user/domain.dart';
import 'package:lumin_ledger/user/infrastructure.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserFirebaseProvider _userFirebaseProvider;

  UserRepositoryImpl(this._userFirebaseProvider);

  @override
  Stream<Option<UserEntity>> getUser() {
    return _userFirebaseProvider.getUser();
  }

  @override
  Future<void> saveUser(UserEntity user) {
    return _userFirebaseProvider.saveUser(user);
  }
}
