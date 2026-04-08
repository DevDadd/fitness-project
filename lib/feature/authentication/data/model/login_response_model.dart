import 'package:json_annotation/json_annotation.dart';
import 'package:fitnessai/feature/authentication/domain/entity/login_reponse.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginModel {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "expires_in")
  String? expiresIn;

  LoginModel({this.message, this.userId, this.token, this.expiresIn});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  LoginResponse toEntity() {
    return LoginResponse(
      message: message ?? '',
      userId: userId ?? '',
      token: token ?? '',
      expiresIn: expiresIn ?? '',
    );
  }
}
