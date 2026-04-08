import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fitnessai/feature/authentication/cubit/authentication_state.dart';
import 'package:fitnessai/feature/authentication/domain/usecases/authentication_usecase.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this.authenticationUsecase)
    : super(const AuthenticationState());

  final AuthenticationUsecase authenticationUsecase;

  /// Đưa state về ban đầu (ví dụ sau khi quay lại màn đăng nhập).
  void reset() => emit(const AuthenticationState());

  Future<void> login(String email, String password) async {
    if (state.status == AuthenticationStatus.loading) {
      return;
    }

    emit(
      state.copyWith(
        status: AuthenticationStatus.loading,
        errorMessage: '',
      ),
    );

    try {
      final response = await authenticationUsecase.login(email, password);

      emit(
        state.copyWith(
          status: AuthenticationStatus.success,
          loginResponse: response,
          errorMessage: '',
        ),
      );
    } on DioException catch (e) {
      final errorMessage = _handleDioError(e);

      emit(
        state.copyWith(
          status: AuthenticationStatus.error,
          errorMessage: errorMessage,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthenticationStatus.error,
          errorMessage: "Unknown error",
        ),
      );
    }
  }

  String _handleDioError(DioException e) {
    try {
      final data = e.response?.data;

      if (data is Map<String, dynamic>) {
        return data["error"] ??
            data["message"] ??
            data["detail"] ??
            "Login failed";
      }
    } catch (_) {}

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return "Connection timeout";
    }

    if (e.type == DioExceptionType.badResponse) {
      return "Server error";
    }

    return "Network error";
  }
}
