import 'package:march25batch6pm/home_screen.dart';
import 'package:march25batch6pm/utils/color_const.dart';
import 'package:march25batch6pm/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: clrAppBarBackTheme,
        ),
      ),
      // home: const HomeScreen(),
      onGenerateRoute: MyRoutes.onGenerate,
      // routes: {
      //   "/": (BuildContext context) => const HomeScreen(),
      //   routeScreen1: (BuildContext context) => const Screen1(),
      //   routeScreen2: (BuildContext context) => const Screen2(),
      // },
    ),
  );
}