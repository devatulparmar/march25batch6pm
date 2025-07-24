import 'package:march25batch6pm/image_screen.dart';
import 'package:march25batch6pm/screen1.dart';
import 'package:march25batch6pm/utils/const.dart';
import 'package:march25batch6pm/utils/routes_const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future _simpleDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                title: Text("Logout?"),
                subtitle: Text("Are you sure?"),
              )),
        );
      },
    );
  }

  Future _logOut() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout?"),
          content: const Text("Are you sure?"),
          scrollable: true,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  routeLoginScreen,
                  (route) => false,
                );
              },
              child: const Text(
                "Yes",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  Future _aboutDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (BuildContext context) {
        return AboutDialog(
          applicationIcon: Image.asset(
            imgBirdImage,
            height: 35,
            width: 35,
          ),
          applicationName: "Batch 6 PM",
          applicationVersion: "1.0.0",
          applicationLegalese: "applicationLegalese",
          children: [
            Text("Hello"),
          ],
        );
      },
    );
  }

  bool isLogin = false;
  SharedPreferences? prefs;

  Future _getPreference() async {
    prefs = await SharedPreferences.getInstance();
    isLogin = prefs?.getBool(prefLogin) ?? false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getPreference();
  }

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
                onTap: () {
                  print("Clicked");
                },
              ),
              const SizedBox(
                height: 5,
              ),
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
                onTap: () {
                  print("Clicked");
                },
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                leading: const Icon(Icons.home),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text("About Us"),
                tileColor: Colors.cyan,
                selected: true,
                selectedTileColor: Colors.green,
                selectedColor: Colors.white,
                textColor: Colors.white,
                iconColor: Colors.white,
                onTap: () {
                  _aboutDialog();
                },
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                leading: const Icon(Icons.home),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text("Logout"),
                tileColor: Colors.cyan,
                selected: true,
                selectedTileColor: Colors.green,
                selectedColor: Colors.white,
                textColor: Colors.white,
                iconColor: Colors.white,
                onTap: () {
                  _logOut();
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
                Navigator.pushNamed(context, routeListviewScreen);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                "ListView Screen",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
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
            isLogin
                ? ElevatedButton(
                    onPressed: () async {
                     await prefs?.setBool("isLogin", false);

                     Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  )
                : ElevatedButton(
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
