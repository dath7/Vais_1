import 'package:bloc/bloc.dart';

import 'package:school_app/authentication/bloc/authentication_event.dart';
import 'package:school_app/authentication/bloc/authentication_state.dart';

import 'package:school_app/repo/netword_repo.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<LogInRequest>(_onLoginRequest);
    on<LogoutRequest>(_onLogoutRequest);
  }

  void _onLoginRequest(LogInRequest event, Emitter emit) async {
    try {
      final userModel =
          await NetworkRepo.postRequest(event.email, event.password);
      emit(AuthenticationSuccess(userModel: userModel));
    } catch (e) {
      emit(AuthenticationFail());
    }
  }

  void _onLogoutRequest(LogoutRequest event, Emitter emitter) {}
}


// initial -> home 
// login

