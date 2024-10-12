import 'package:get/get.dart';

import 'IAuthService.dart';

class AuthService extends GetxService {
  final IAuthService _authRepository;

  AuthService(this._authRepository);

  Future<void> login(String username, String password) async {
    await _authRepository.login(username, password);
  }
}
