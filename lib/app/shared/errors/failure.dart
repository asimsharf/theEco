class Failure implements Exception {
  late StackTrace stackTrace;
  late String message;

  Failure({required this.message, required this.stackTrace});

  @override
  String toString() {
    return message;
  }
}

class UnAuthorizedFailure extends Failure {
  int? errorCode;

  UnAuthorizedFailure({
    required super.message,
    required super.stackTrace,
    required this.errorCode,
  });

  @override
  String toString() {
    return message;
  }
}

class NotFoundFailure extends Failure {
  int? errorCode;

  NotFoundFailure({
    required super.message,
    required super.stackTrace,
    required this.errorCode,
  });

  @override
  String toString() {
    return message;
  }
}

class CacheFailure extends Failure {
  CacheFailure({
    required super.message,
    required super.stackTrace,
  });

  @override
  String toString() {
    return message;
  }
}
