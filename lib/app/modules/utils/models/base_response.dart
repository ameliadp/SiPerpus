class BaseResponse {
  final dynamic data;
  final String message;
  final int status;

  const BaseResponse({
    this.data,
    required this.status,
    required this.message,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        message: json["message"] ?? "",
        data: json["data"] ?? "",
        status: json["status"] ?? 0,
      );
}
