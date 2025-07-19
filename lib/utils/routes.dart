import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:march25batch6pm/bottom_nav_screen.dart';
import 'package:march25batch6pm/home_screen.dart';
import 'package:march25batch6pm/listview_screen.dart';
import 'package:march25batch6pm/login/login_bloc.dart';
import 'package:march25batch6pm/login_screen.dart';
import 'package:march25batch6pm/register_screen.dart';
import 'package:march25batch6pm/screen1.dart';
import 'package:march25batch6pm/screen2.dart';
import 'package:march25batch6pm/screen3.dart';
import 'package:march25batch6pm/screen4.dart';
import 'package:march25batch6pm/screen5.dart';
import 'package:march25batch6pm/utils/routes_const.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  final LoginBloc _loginPageBloc = LoginBloc();
  static Route onGenerate(RouteSettings settingObject) {
    // if (settingObject.name == routeHomeScreen) {
    //   return MaterialPageRoute(
    //     builder: (BuildContext context) => const HomeScreen(),
    //   );
    // }
    // else if (settingObject.name == routeScreen1) {
    //   return MaterialPageRoute(
    //     builder: (BuildContext context) => const Screen1(),
    //   );
    // }
    // else if (settingObject.name == routeScreen2) {
    //   return MaterialPageRoute(
    //     builder: (BuildContext context) => const Screen2(),
    //   );
    // }
    // else {
    //   return MaterialPageRoute(
    //     builder: (BuildContext context) => const HomeScreen(),
    //   );
    // }

    switch (settingObject.name) {
      case "/":
        return MaterialPageRoute(
          builder: (BuildContext context) => const BottomNavScreen(),
        );
      case routeHomeScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );
      case routeScreen1:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Screen1(),
        );
      case routeScreen2:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Screen2(),
        );
      case routeScreen3:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Screen3(),
        );
      case routeScreen4:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Screen4(),
        );
      case routeScreen5:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Screen5(),
        );
      case routeLoginScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );
      case routeRegisterScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const RegisterScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text("No route found!"),
            ),
          ),
        );
    }
  }

  Route onNestedGenerate(RouteSettings settings) {
    late Widget widget;
    switch (settings.name) {
      case "/":
        widget = const HomeScreen();
        break;
      case routeRegisterScreen:
        widget = const RegisterScreen();
        break;
      case routeListviewScreen:
        widget = const ListviewScreen();
        break;
      case routeLoginScreen:
        widget = BlocProvider<LoginBloc>.value(
          value: _loginPageBloc,
          child: const LoginScreen(),
        );
        break;
      default:
        widget = Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Text("No route found!"),
          ),
        );
    }
    return MaterialPageRoute(builder: (_) => widget);
  }
}
