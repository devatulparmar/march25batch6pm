
import 'package:march25batch6pm/screen2.dart';
import 'package:march25batch6pm/utils/routes_const.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: const Text("Screen 1"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => const Screen2(),
              //   ),
              // );

              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => const Screen2(),
              //   ),
              // );

              ///second method
              Navigator.pushReplacementNamed(context, routeScreen2);

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text(
              "Go to Screen 2",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
