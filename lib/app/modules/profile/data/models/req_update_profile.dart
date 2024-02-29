class ReqUpdateProfile {
  final String? email;

  ReqUpdateProfile({this.email});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
    };
  }
}
