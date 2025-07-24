import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:march25batch6pm/login/login_event.dart';
import 'package:march25batch6pm/login/login_state.dart';
import 'package:march25batch6pm/repository/api_repository.dart';
import 'package:march25batch6pm/utils/common_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    var result = await ApiRepository.postAPICall(
        "https://reqres.in/api/login", header, bodyData);
    if (result.statusCode == successStatusCode) {
      var data = jsonDecode(result.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(prefLogin, true);
      await prefs.setString(prefLoginToken, data["token"]);
      CommonSnackBar.showMySnackBar(
          message: "Login Success !", bgColor: Colors.green);
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
      options: Options(
        headers: header,
        followRedirects: false,
        receiveTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 3),
        responseType: ResponseType.json,
        preserveHeaderCase: true,
        persistentConnection: true,
      ),
      data: {
        "email": email,
        "password": password,
      },
    );
  }
}
