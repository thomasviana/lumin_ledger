import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:lumin_ledger/user/domain.dart';

@injectable
class GetProfileInfo {
  final UserRepository _userRepository;

  const GetProfileInfo(this._userRepository);

  Stream<Option<UserEntity>> call() => _userRepository.getUser();
}
