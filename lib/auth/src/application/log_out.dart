import 'package:injectable/injectable.dart';

import '../../domain.dart';

@injectable
class LogOut {
  final AuthService _authService;

  const LogOut(this._authService);

  Future<void> call() => _authService.logOut();
}
