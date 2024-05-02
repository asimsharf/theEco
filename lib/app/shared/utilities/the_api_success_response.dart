class TheApiSuccessResponse<T> {
  /// data : {"id":1,"name":"John Doe","email":"example@domain.com"}
  /// message : "User [fetched|created|updated|deleted] successfully."
  /// code : [fetched->200|created->201|updated->200|deleted->204]
  final T data;
  final String message;
  final int code;
  final bool status;

  TheApiSuccessResponse({
    required this.data,
    required this.message,
    required this.code,
    required this.status,
  });

  factory TheApiSuccessResponse.fromJson(Map<String, dynamic> json) {
    return TheApiSuccessResponse(
      data: json['data'],
      message: json['message'],
      code: json['code'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'message': message,
      'code': code,
      'status': status,
    };
  }

  @override
  String toString() {
    return String.fromCharCodes(
      toJson().entries.expand((e) => '$e'.codeUnits).toList(),
    );
    // return 'TheApiSuccessResponse{data: $data, message: $message, code: $code, status: $status}';
  }
}
