class TheApiFailureResponse {
  /// message : "The given data was invalid."
  /// code : 422
  /// status : false
  final String message;
  final int code;
  final bool status;

  TheApiFailureResponse({
    required this.message,
    required this.code,
    required this.status,
  });

  factory TheApiFailureResponse.fromJson(Map<String, dynamic> json) {
    return TheApiFailureResponse(
      message: json['message'],
      code: json['code'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code,
      'status': status,
    };
  }

  @override
  String toString() {
    return 'TheApiFailureResponse{message: $message, code: $code, status: $status}';
  }
}
