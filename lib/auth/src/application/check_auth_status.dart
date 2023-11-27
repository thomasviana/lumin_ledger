import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:lumin_ledger/auth/domain.dart';

@injectable
class CheckAuthStatus {
  final AuthService _authService;

  const CheckAuthStatus(this._authService);

  Stream<bool> call() => _authService.checkAuthStatus();
}
