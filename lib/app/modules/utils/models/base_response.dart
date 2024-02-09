class BaseResponse {
  final dynamic data;
  final String message;
  final bool error;

  const BaseResponse({
    this.data,
    required this.message,
    required this.error,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json, String? dataKey) =>
      BaseResponse(
        message: json["message"] ?? "",
        data: json[dataKey] ?? "",
        error: json["error"] ?? "",
      );
}
