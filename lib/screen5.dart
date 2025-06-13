import 'package:march25batch6pm/home_screen.dart';
import 'package:march25batch6pm/screen3.dart';
import 'package:march25batch6pm/utils/routes_const.dart';
import 'package:flutter/material.dart';

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.pop(context);
            // Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
        backgroundColor: Colors.brown.shade500,
        title: const Text("Screen 5"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Screen3(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text(
              "Go to Screen 3",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => const HomeScreen(),
              //   ),
              //   (Route route) => false,
              // );

              ///Second Method
              Navigator.pushNamedAndRemoveUntil(
                context,
                routeHomeScreen,
                (Route route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text(
              "Go to Home Screen",
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
