import 'package:march25batch6pm/image_screen.dart';
import 'package:march25batch6pm/screen1.dart';
import 'package:march25batch6pm/utils/routes_const.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeRegisterScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text(
              "Register Screen",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),    ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => const Screen1(),
              //   ),
              // );

              ///second method
              Navigator.pushNamed(context, routeLoginScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text(
              "Login Screen",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => const Screen1(),
              //   ),
              // );

              ///second method
              Navigator.pushNamed(context, routeScreen1);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text(
              "Go to Screen 1",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ImageScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text(
              "Image Screen",
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
