import 'package:equatable/equatable.dart';
import 'package:school_app/models/user_model.dart';

//enum AuthenticationStatus { initial, success, unauthenticated, fail,loading }

sealed class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class Unauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final UserModel userModel;
  AuthenticationSuccess({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class AuthenticationFail extends AuthenticationState {
  final String message;
  AuthenticationFail({this.message = "Error"});
  @override
  List<Object> get props => [];
}



//   const AuthenticationState.initial() : this();
//   const AuthenticationState.success(UserModel user)
//       : this(status: AuthenticationStatus.success, user: user);
//   const AuthenticationState.unauthenticated()
//       : this(status: AuthenticationStatus.unauthenticated);
//   const AuthenticationState.fail() : this(status: AuthenticationStatus.fail);

//   @override
//   List<Object> get props => [status, user];
// }
