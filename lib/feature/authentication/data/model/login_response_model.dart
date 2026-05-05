import 'package:fitnessai/feature/authentication/domain/entity/login_reponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginModel {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "expires_in")
  String? expiresIn;
  @JsonKey(name: "user")
  User? user;

  LoginModel({this.message, this.token, this.expiresIn, this.user});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "user_name")
  String? userName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "avatar")
  String? avatar;

  User({this.userId, this.userName, this.email, this.gender, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

extension LoginModelMapper on LoginModel {
  LoginResponse toEntity() {
    final userData = user ?? User();

    return LoginResponse(
      message: message ?? '',
      userId: userData.userId ?? '',
      token: token ?? '',
      expiresIn: expiresIn ?? '',
      user: LoginUser(
        userId: userData.userId ?? '',
        userName: userData.userName ?? '',
        email: userData.email ?? '',
        gender: userData.gender ?? '',
        avatar: userData.avatar ?? '',
      ),
    );
  }
}
