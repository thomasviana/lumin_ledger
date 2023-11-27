import 'package:fpdart/fpdart.dart';

import 'user_entity.dart';

abstract class UserRepository {
  Stream<Option<UserEntity>> getUser();

  Future<void> saveUser(UserEntity user);
}
