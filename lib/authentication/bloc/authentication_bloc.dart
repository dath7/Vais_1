import 'package:bloc/bloc.dart';

import 'package:school_app/authentication/bloc/authentication_event.dart';
import 'package:school_app/authentication/bloc/authentication_state.dart';
import 'package:school_app/models/user_model.dart';

import 'package:school_app/repo/netword_repo.dart';
import 'package:school_app/repo/shared_prefs_repo.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<LogInRequest>(_onLoginRequest);
    on<LogoutRequest>(_onLogoutRequest);
    on<CheckAutoLogin>(_onCheckAutoLogin);
    on<LoadingUser>(_onLoadingUser);
  }

  void _onLoginRequest(LogInRequest event, Emitter emit) async {
    try {
      final dataFetched =
          await NetworkRepo.postRequest(event.email, event.password);
      final user = UserModel.fromJson(dataFetched["user"]);
      SharedPreprerencesRepo.saveInfor(
          dataFetched["tokens"]["access"]["token"]);
      emit(AuthenticationSuccess(userModel: user));
    } catch (e) {
      emit(AuthenticationFail());
    }
  }

  void _onLogoutRequest(LogoutRequest event, Emitter emitter) {}
  void _onCheckAutoLogin(CheckAutoLogin event, Emitter emit) async {
    try {
      final loggedIn = await SharedPreprerencesRepo.autoLogin();
      if (loggedIn) {
        final data = await NetworkRepo.getRequest();
        print(await SharedPreprerencesRepo.getInfo());
        print(data);
        emit(AuthenticationSuccess(userModel: UserModel.fromJson(data)));
      } else {
        emit(AuthenticationInitial());
      }
    } catch (e) {
      // network error, v.v
      emit(AuthenticationFail());
    }
  }

  void _onLoadingUser(LoadingUser event, Emitter emit) async {
    try {
      final loggedIn = await SharedPreprerencesRepo.autoLogin();
      if (loggedIn) {
        emit(AuthenticationLoading());
      } else {
        emit(AuthenticationInitial());
      }
    } catch (e) {
      // network error, v.v
      emit(AuthenticationFail());
    }
  }
}



// initial -> home 
// login

