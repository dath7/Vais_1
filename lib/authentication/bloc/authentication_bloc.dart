import 'package:bloc/bloc.dart';

import 'package:school_app/authentication/bloc/authentication_event.dart';
import 'package:school_app/authentication/bloc/authentication_state.dart';
import 'package:school_app/models/user_model.dart';

import 'package:school_app/repo/netword_repo.dart';
import 'package:school_app/repo/shared_prefs_repo.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(Unauthenticated()) {
    on<LoginRequest>(_onLoginRequest);
    on<LogoutRequest>(_onLogoutRequest);
    on<CheckAutoLogin>(_onCheckAutoLogin);
    on<LoadingUser>(_onLoadingUser);
    on<LoginRetry>(_onLoginRetry);
  }

  void _onLoginRequest(LoginRequest event, Emitter emit) async {
    try {
      final loginInfo =
          await NetworkRepo.postRequest(event.email, event.password);

      //print(loginInfo["user"]);
      // print(UserModel.fromJson(loginInfo["user"]).toString());
      //final user = UserModel.fromJson(dataFetched["user"]);
      //print(loginInfo);
      SharedPreprerencesRepo.saveInfor(loginInfo["tokens"]["access"]["token"]);
      final dataUser = await NetworkRepo.getRequest();
      //print(dataUser);
      emit(AuthenticationSuccess(userModel: UserModel.fromJson(dataUser)));
    } catch (e) {
      //print(e.runtimeType);
      final errorMessage =
          await NetworkRepo.postRequest(event.email, event.password);

      emit(AuthenticationFail(
          message: errorMessage)); //message: e.response!.data["message"]));
    }
  }

  void _onLogoutRequest(LogoutRequest event, Emitter emit) {
    try {
      SharedPreprerencesRepo.deleteInfor();
      emit(Unauthenticated());
    } on Exception catch (e) {
      emit(AuthenticationLoading());
    }
  }

  void _onCheckAutoLogin(CheckAutoLogin event, Emitter emit) async {
    try {
      final loggedIn = await SharedPreprerencesRepo.autoLogin();
      if (loggedIn) {
        final data = await NetworkRepo.getRequest();

        // print(data);

        emit(AuthenticationSuccess(userModel: UserModel.fromJson(data)));
      } else {
        emit(Unauthenticated());
      }
    } on Exception catch (e) {
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
        emit(Unauthenticated());
      }
    } on Exception catch (e) {
      // network error, v.v

      emit(AuthenticationFail());
    }
  }

  void _onLoginRetry(LoginRetry event, Emitter emit) {
    emit(Unauthenticated());
  }
}



// initial -> home 
// login

