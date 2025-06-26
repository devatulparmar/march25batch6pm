import 'dart:ui';

import 'package:march25batch6pm/utils/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.close,
          ),
        ),
        title: const Text("Image Screen"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Image(
                  image: const AssetImage(imgBirdImage),
                  fit: BoxFit.fill,
                  errorBuilder:
                      (BuildContext context, Object obj, StackTrace? sT) {
                    return const Icon(
                      Icons.image_not_supported,
                      color: Colors.red,
                      size: 100,
                    );
                  },
                ),
              ),
              const Text(
                "Bird Image",
                style: TextStyle(color: Colors.red, fontSize: 25),
              ),
              const Positioned(
                left: 40,
                bottom: 30,
                child: Text(
                  "Hello",
                  style: TextStyle(color: Colors.red, fontSize: 25),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 150,
            width: 150,
            child: Image(
              image: const NetworkImage(
                  "https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg"),
              fit: BoxFit.fill,
              errorBuilder: (BuildContext context, Object obj, StackTrace? sT) {
                return const Icon(
                  Icons.image_not_supported,
                  color: Colors.red,
                  size: 100,
                );
              },
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    "https://sample-files.com/downloads/images/jpg/landscape_hires_4000x2667_6.83mb.jpg",
                placeholder: (BuildContext context, String str) {
                  return const SizedBox(
                    height: 150,
                    width: 150,
                    child: CircularProgressIndicator(
                      color: Colors.green,
                      strokeWidth: 10,
                      backgroundColor: Colors.black,
                    ),
                  );
                },
                // errorWidget: (BuildContext context, String str, Object obj) {
                //   return Icon(
                //     Icons.image_not_supported,
                //     color: Colors.red,
                //     size: 100,
                //   );
                // },
              ),
            ),
          ),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.red,
            foregroundImage: const CachedNetworkImageProvider(
              "https://.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg",
            ),
            onForegroundImageError: (Object obj, StackTrace? sT) {
              print("image error");
              const Icon(
                Icons.image_not_supported,
                color: Colors.red,
                size: 100,
              );
            },
            backgroundImage: const AssetImage(imgBirdImage),
            onBackgroundImageError: (Object obj, StackTrace? sT) {
              const Icon(
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
