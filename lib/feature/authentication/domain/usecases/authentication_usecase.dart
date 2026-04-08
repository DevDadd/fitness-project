import 'package:fitnessai/feature/authentication/domain/entity/login_reponse.dart';
import 'package:fitnessai/feature/authentication/domain/repository/authentication_repository.dart';

class AuthenticationUsecase {
  final AuthenticationRepository authenticationRepository;
  AuthenticationUsecase(this.authenticationRepository);
  Future<LoginResponse> login(String email, String password) async {
    return await authenticationRepository.login(email, password);
  }
}
