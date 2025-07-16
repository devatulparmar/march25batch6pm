import 'package:bloc/bloc.dart';
import 'package:march25batch6pm/login/login_event.dart';
import 'package:march25batch6pm/login/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/const.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(LoginInitState()) {

    on<LoginEvents>((event, emit) async {
      print("LoginInitState called");
      // emit(LoginLoadingState());
    });

    on<LoginButtonClickEvent>((event, emit) async {
      print("LoginButtonClickEvent called");
      emit(LoginLoadingState());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(prefLogin, true);
      await Future.delayed(const Duration(seconds: 4));
      emit(LoginSuccessState());
    });
  }
}
