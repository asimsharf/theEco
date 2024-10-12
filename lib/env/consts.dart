// flutter run --dart-define-from-file=env/dev.json
// flutter run --dart-define-from-file=env/prod.json
// flutter run --dart-define-from-file=env/stg.json

class Consts {
  static const String apiKey = String.fromEnvironment(
    'apiKey',
    defaultValue: 'YOUR_API',
  );
  static const String secretKey = String.fromEnvironment(
    'secret',
    defaultValue: 'YOUR_SECRET',
  );
}
