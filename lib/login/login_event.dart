
import 'package:flutter/material.dart';

@immutable
abstract class LoginEvents {}

class LoginButtonClickEvent extends LoginEvents {
  final String email;
  final String password;

  LoginButtonClickEvent(this.email, this.password);
}