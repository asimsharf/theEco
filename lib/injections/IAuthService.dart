abstract class IAuthService {
  Future<void> login(String username, String password);
  Future<void> logout();
}
