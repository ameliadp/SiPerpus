class ReqRegisterModel {
  final String? userName;
  final String? email;
  final String? password;
  final String? address;

  ReqRegisterModel(
      {required this.email, this.password, this.address, this.userName});

  factory ReqRegisterModel.fromJson(Map<String, dynamic> json) =>
      ReqRegisterModel(
        email: json["email"],
        password: json["password"],
        address: json["address"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "user_name": userName,
        "address": address
      };
}
