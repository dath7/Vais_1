import 'package:bloc/bloc.dart';
import 'package:school_app/authentication/bloc/authentication_event.dart';
import 'package:school_app/authentication/bloc/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState.initial()) {
    on<LogInRequest>(_onLoginRequest);
    on<LogoutRequest>(_onLogoutRequest);
  }

  void _onLoginRequest(AuthenticationEvent event, Emitter emitter) {}
  void _onLogoutRequest(AuthenticationEvent event, Emitter emitter) {}
}
