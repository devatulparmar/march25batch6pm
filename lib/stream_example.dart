import 'dart:async';

import 'package:flutter/material.dart';

class MyStreamScreen extends StatefulWidget {
  const MyStreamScreen({Key? key}) : super(key: key);

  @override
  State<MyStreamScreen> createState() => _MyStreamScreenState();
}

class _MyStreamScreenState extends State<MyStreamScreen> {
  final StreamController _streamController = StreamController();

  // String valueOfStream = "";
  int counter = 0;

  // Stream get streamValue => _streamController.stream;
  Stream get streamCounterValue => _streamController.stream;

  @override
  void initState() {
    // _streamController.add("Hello");
    streamCounterValue.listen(
      (dynamic value) {
        setState(() {
          counter = value + 1;
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Screen"),
      ),
      body: Column(
        children: [
          Text("Clicked $counter"),
          ElevatedButton(
            onPressed: () {
              _streamController.add(counter);
            },
            child: const Text("Get Value from Stream"),
          ),
        ],
      ),
    );
  }
}
