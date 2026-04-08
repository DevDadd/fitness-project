import 'package:fitnessai/feature/authentication/domain/entity/login_reponse.dart';

abstract class AuthenticationRepository {
  Future<LoginResponse> login(String email, String password);
}
