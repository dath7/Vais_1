sealed class AuthenticationEvent {}

class LoginRequest extends AuthenticationEvent {
  final String email;
  final String password;
  LoginRequest({required this.email, required this.password});
}

class LogoutRequest extends AuthenticationEvent {}

class CheckAutoLogin extends AuthenticationEvent {}

class LoadingUser extends AuthenticationEvent {}

class LoginRetry extends AuthenticationEvent {}
