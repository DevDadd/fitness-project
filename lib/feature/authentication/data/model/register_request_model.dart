import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable(createFactory: false)
class RegisterRequestModel {
  RegisterRequestModel({
    required this.user_name,
    required this.email,
    required this.password,
    required this.gender,
  });

  final String user_name;
  final String email;
  final String password;
  final String gender;

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
