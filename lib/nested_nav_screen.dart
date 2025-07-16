
import 'package:flutter/material.dart';
import 'package:march25batch6pm/utils/routes.dart';

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class NestedNavScreen extends StatelessWidget {
  const NestedNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nested Route",
      debugShowCheckedModeBanner: false,
      navigatorObservers: <NavigatorObserver>[routeObserver],
      onGenerateRoute: MyRoutes().onNestedGenerate,
    );
  }
}
