import 'dart:convert';

UserModel userModelFromString(String str) =>
    UserModel.fromJson(json.decode(str));

String userModelToString(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({this.jwt});

  String? jwt;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(jwt: json["jwt"]);

  Map<String, dynamic> toJson() => {"jwt": jwt};
}
