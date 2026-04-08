import 'package:dio/dio.dart';
import 'package:fitnessai/feature/authentication/data/model/login_request_model.dart';
import 'package:fitnessai/feature/authentication/data/model/login_response_model.dart';
import 'package:fitnessai/feature/authentication/data/model/register_request_model.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_service.g.dart';

@RestApi(baseUrl: "https://fitness-backend-buax.onrender.com")
abstract class AuthenticationService {
  factory AuthenticationService(Dio dio, {String baseUrl}) =
      _AuthenticationService;

  @POST("/api/login/")
  Future<LoginModel> login(@Body() LoginRequestModel body);

  @POST("/api/signup/")
  Future<LoginModel> register(@Body() RegisterRequestModel body);
}
