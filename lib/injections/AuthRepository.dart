import 'IAuthService.dart';

class AuthRepository implements IAuthService {
  @override
  Future<void> login(String username, String password) async {
    // Implementation for login logic
  }

  @override
  Future<void> logout() async {
    // Implementation for logout logic
  }
}
