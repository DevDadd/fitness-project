import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:fitnessai/feature/authentication/domain/entity/login_reponse.dart';

part 'authentication_state.g.dart';

enum AuthenticationStatus { initial, loading, success, error }

@CopyWith()
class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.status = AuthenticationStatus.initial,
    this.loginResponse,
    this.errorMessage = '',
  });

  final AuthenticationStatus status;
  final LoginResponse? loginResponse;
  final String errorMessage;

  @override
  List<Object?> get props => [status, loginResponse, errorMessage];
}
