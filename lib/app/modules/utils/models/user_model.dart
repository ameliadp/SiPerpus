// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? userId;
  final String? userName;
  final String? email;
  final String? address;
  final String? role;
  final String? token;

  UserModel({
    this.userId,
    this.userName,
    this.email,
    this.address,
    this.role,
    this.token,
  });

  UserModel copyWith({
    String? userId,
    String? userName,
    String? email,
    String? address,
    String? role,
    String? token,
  }) =>
      UserModel(
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        address: address ?? this.address,
        role: role ?? this.role,
        token: token ?? this.token,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"]?.toString(),
        userName: json["user_name"],
        email: json["email"],
        address: json["address"],
        role: json["role"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "email": email,
        "address": address,
        "role": role,
        "token": token,
      };
}
