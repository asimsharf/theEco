class Endpoints {
  static const String baseUrl = String.fromEnvironment(
    'baseUrl',
    defaultValue: 'http://localhost:3000',
  );
  static const String login = '$baseUrl/login';
  static const String register = '$baseUrl/register';
  static const String forgotPassword = '$baseUrl/forgot-password';
}
