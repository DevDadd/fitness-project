// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
  message: json['message'] as String?,
  token: json['token'] as String?,
  expiresIn: json['expires_in'] as String?,
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'expires_in': instance.expiresIn,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
  userId: json['user_id'] as String?,
  userName: json['user_name'] as String?,
  email: json['email'] as String?,
  gender: json['gender'] as String?,
  avatar: json['avatar'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'user_id': instance.userId,
  'user_name': instance.userName,
  'email': instance.email,
  'gender': instance.gender,
  'avatar': instance.avatar,
};
