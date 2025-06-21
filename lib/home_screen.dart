import 'package:march25batch6pm/image_screen.dart';
import 'package:march25batch6pm/screen1.dart';
import 'package:march25batch6pm/utils/const.dart';
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
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  gradient: const LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.indigo,
                      Colors.green,
                    ],
                    tileMode: TileMode.mirror,
                    stops: [0.0, 0.2, 1.0],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(imgBirdImage),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text("Home"),
                tileColor: Colors.cyan,
                selected: false,
                selectedTileColor: Colors.green,
                selectedColor: Colors.white,
                textColor: Colors.white,
                iconColor: Colors.white,
                onTap: (){
                  print("Clicked");
                },
              ),
              const SizedBox(height: 5,),
              ListTile(
                leading: const Icon(Icons.home),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text("Orders"),
                tileColor: Colors.cyan,
                selected: true,
                selectedTileColor: Colors.green,
                selectedColor: Colors.white,
                textColor: Colors.white,
                iconColor: Colors.white,
                onTap: (){
                  print("Clicked");
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          // leading: const Icon(
          //   Icons.menu,
          // ),
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
      ),
    );
  }
}
