import 'dart:convert';

BadResponse badResponseFromJson(String str) =>
    BadResponse.fromJson(json.decode(str));

String badResponseToJson(BadResponse data) => json.encode(data.toJson());

class BadResponse {
  BadResponse({
    this.error,
    this.message,
  });

  final bool? error;
  final String? message;

  factory BadResponse.fromJson(Map<String, dynamic> json) => BadResponse(
        error: json["error"] ?? false,
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
      };
}
