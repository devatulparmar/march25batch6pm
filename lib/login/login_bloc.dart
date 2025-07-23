import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:march25batch6pm/login/login_event.dart';
import 'package:march25batch6pm/login/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../utils/const.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(LoginInitState()) {
    on<LoginEvents>((event, emit) async {
      print("LoginInitState called");
    });

    on<LoginButtonClickEvent>(
        (event, emit) async => _login(event.email, event.password, emit));
  }

  Future _login(String email, String password, emit) async {
    emit(LoginLoadingState());
    Uri uriLink = Uri.parse("https://reqres.in/api/login");
    Map<String, String> header = {
      "x-api-key": "reqres-free-v1",
    };
    var bodyData = {
      "email": email,
      "password": password,
    };
    // var bodyData = {
    //   "email": "eve.holt@reqres.in",
    //   "password": "cityslicka"
    // };
    var result = await http.post(uriLink, headers: header, body: bodyData);
    if (result.statusCode == successStatusCode) {
      var data = jsonDecode(result.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(prefLogin, true);
      await prefs.setString(prefLoginToken, data["token"]);
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState());
    }
  }

  Future _LoginWithDio(String email, String password, emit) async {
    Dio dio = Dio();
    FormData formData = FormData.fromMap({
      "email": email,
      "password": password,
    });
    Map<String, String> header = {
      "x-api-key": "reqres-free-v1",
    };
    var result = await dio.post(
      "https://reqres.in/api/login",
      // data: formData,
      options: Options(headers: header),
      data: {
        "email": email,
        "password": password,
      },
    );
  }
}
