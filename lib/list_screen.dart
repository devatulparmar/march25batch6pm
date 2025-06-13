
import 'package:march25batch6pm/utils/const.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Screen"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(40),
        // scrollDirection: Axis.horizontal,
        // physics: const AlwaysScrollableScrollPhysics(),
        // physics: const BouncingScrollPhysics(),
        // physics: const ClampingScrollPhysics(),
        // physics: const FixedExtentScrollPhysics(),
        // physics: const NeverScrollableScrollPhysics(),
        physics: const ScrollPhysics(),
        reverse: true,
        children: [
          Image(
            image: const AssetImage(imgBirdImage),
            fit: BoxFit.fill,
            errorBuilder: (BuildContext context, Object obj, StackTrace? sT) {
              return const Icon(
                Icons.image_not_supported,
                color: Colors.red,
                size: 100,
              );
            },
          ),
          const SizedBox(height: 20, width: 10,),
          Image(
            image: const AssetImage(imgBirdImage),
            fit: BoxFit.fill,
            errorBuilder: (BuildContext context, Object obj, StackTrace? sT) {
              return const Icon(
                Icons.image_not_supported,
                color: Colors.red,
                size: 100,
              );
            },
          ),
          const SizedBox(height: 20),
          Image(
            image: const AssetImage(imgBirdImage),
            fit: BoxFit.fill,
            errorBuilder: (BuildContext context, Object obj, StackTrace? sT) {
              return const Icon(
                Icons.image_not_supported,
                color: Colors.red,
                size: 100,
              );
            },
          ),
          const SizedBox(height: 20),
          Image(
            image: const AssetImage(imgBirdImage),
            fit: BoxFit.fill,
            errorBuilder: (BuildContext context, Object obj, StackTrace? sT) {
              return const Icon(
                Icons.image_not_supported,
                color: Colors.red,
                size: 100,
              );
            },
          ),
          const SizedBox(height: 20),
          Image(
            image: const AssetImage(imgBirdImage),
            fit: BoxFit.fill,
            errorBuilder: (BuildContext context, Object obj, StackTrace? sT) {
              return const Icon(
                Icons.image_not_supported,
                color: Colors.red,
                size: 100,
              );
            },
          ),
          const SizedBox(height: 20),
          Image(
            color: Colors.red,
            image: const AssetImage(imgBirdImage),
            fit: BoxFit.fill,
            errorBuilder: (BuildContext context, Object obj, StackTrace? sT) {
              return const Icon(
                Icons.image_not_supported,
                color: Colors.red,
                size: 100,
              );
            },
          ),
        ],
      ),
    );
  }
}
