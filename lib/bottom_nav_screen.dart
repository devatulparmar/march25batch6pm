import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:march25batch6pm/nested_nav_screen.dart';
import 'package:march25batch6pm/services/notification_service.dart';
import 'package:march25batch6pm/services/push_notification_service.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  List<Widget> screensList = [
    const NestedNavScreen(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  void _initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await NotificationService.init();
    await NotificationService.isAndroidPermissionGranted();
    await NotificationService.requestPermissions();
    await NotificationService.configureDidReceiveLocalNotificationSubject();
    await NotificationService.configureSelectNotificationSubject();
    await PushNotificationService.setupInteractedMessage();
  }

  @override
  void initState() {
    super.initState();
    _initFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensList.elementAt(selectedIndex),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.favorite), label: "Favorite"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
