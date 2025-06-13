
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GridviewBuilderScreen extends StatefulWidget {
  const GridviewBuilderScreen({super.key});

  @override
  State<GridviewBuilderScreen> createState() => _GridviewBuilderScreenState();
}

class _GridviewBuilderScreenState extends State<GridviewBuilderScreen> {
  List imagesList = [
    "https://photographylife.com/wp-content/uploads/2023/05/Nikon-Z8-Official-Samples-00002.jpg",
    "https://sample-videos.com/img/Sample-jpg-image-10mb.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7L4FWGBOO27k7G_ePJb8usxrPDoo_aqGhWA&s",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid Screen"),
      ),
      body: GridView.builder(
        itemCount: imagesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (BuildContext context, int index) {
          return  Container(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: imagesList[index].toString(),
                placeholder: (BuildContext context, String str){
                  return   SizedBox(
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Colors.green,
                            strokeWidth: 5,
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                // errorWidget: (BuildContext context, String str, Object obj) {
                //   return const Icon(
                //     Icons.image_not_supported,
                //     color: Colors.red,
                //     size: 100,
                //   );
                // },
              ),
            ),
          );
        },
      ),
    );
  }
}
