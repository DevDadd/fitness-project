import 'package:fitnessai/feature/authentication/data/datasource/authentication_service.dart';
import 'package:fitnessai/feature/authentication/data/model/login_request_model.dart';
import 'package:fitnessai/feature/authentication/domain/entity/login_reponse.dart';
import 'package:fitnessai/feature/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationService authenticationService;
  AuthenticationRepositoryImpl(this.authenticationService);

  @override
  Future<LoginResponse> login(String email, String password) async {
    final response = await authenticationService.login(
      LoginRequestModel(email: email, password: password),
    );
    return response.toEntity();
  }
}
