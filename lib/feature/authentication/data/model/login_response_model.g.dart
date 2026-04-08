// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
  message: json['message'] as String?,
  userId: json['user_id'] as String?,
  token: json['token'] as String?,
  expiresIn: json['expires_in'] as String?,
);

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user_id': instance.userId,
      'token': instance.token,
      'expires_in': instance.expiresIn,
    };
