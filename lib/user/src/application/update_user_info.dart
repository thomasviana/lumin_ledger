import 'package:injectable/injectable.dart';
import 'package:lumin_ledger/user/domain.dart';

@injectable
class UpdateUserInfo {
  final UserRepository _userRepository;

  const UpdateUserInfo(this._userRepository);

  Future<void> call(UserEntity user) => _userRepository.saveUser(user);
}
