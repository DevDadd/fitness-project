class LoginResponse {
  final String message;
  final String userId;
  final String token;
  final String expiresIn;

  LoginResponse({
    required this.message,
    required this.userId,
    required this.token,
    required this.expiresIn,
  });
}
