
import 'package:flutter/material.dart';
import 'package:march25batch6pm/utils/routes.dart';

class NestedNavScreen extends StatelessWidget {
  const NestedNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Nested Route",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRoutes.onNestedGenerate,
    );
  }
}
