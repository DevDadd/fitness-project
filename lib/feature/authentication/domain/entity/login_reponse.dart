class LoginResponse {
  final String message;
  final String userId;
  final String token;
  final String expiresIn;
  final LoginUser user;

  LoginResponse({
    required this.message,
    required this.userId,
    required this.token,
    required this.expiresIn,
    required this.user,
  });
}

class LoginUser {
  final String userId;
  final String userName;
  final String email;
  final String gender;
  final String avatar;

  LoginUser({
    required this.userId,
    required this.userName,
    required this.email,
    required this.gender,
    required this.avatar,
  });
}
