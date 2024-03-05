import 'package:equatable/equatable.dart';
import 'package:school_app/authentication/bloc/authentication_state.dart';
import 'package:school_app/authentication/utils/constants/api_const.dart';

class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LogInRequest extends AuthenticationEvent {
  final String url = baseUrl + "login";
  @override
  List<Object> get props => [url];
}

class LogoutRequest extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
