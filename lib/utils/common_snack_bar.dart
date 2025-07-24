import 'package:flutter/material.dart';

import 'const.dart';

class CommonSnackBar {
  static showMySnackBar({String? message, Color? bgColor}) {
    ScaffoldMessenger.of(mainKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message.toString()),
        backgroundColor: bgColor ?? Colors.black,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
