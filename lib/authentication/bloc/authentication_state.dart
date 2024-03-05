import 'package:equatable/equatable.dart';
import 'package:school_app/models/User.dart';

enum AuthenticationStatus { initial, success, unauthenticated }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User user;
  const AuthenticationState(
      {this.status = AuthenticationStatus.initial, this.user = User.empty});

  AuthenticationState.initial() : this();
  AuthenticationState.success(User user)
      : this(status: AuthenticationStatus.success, user: user);
  AuthenticationState.unauthenticated()
      : this(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [status, user];
}
