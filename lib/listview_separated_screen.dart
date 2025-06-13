
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListviewSeparatedScreen extends StatefulWidget {
  const ListviewSeparatedScreen({super.key});

  @override
  State<ListviewSeparatedScreen> createState() => _ListviewSeparatedScreenState();
}

class _ListviewSeparatedScreenState extends State<ListviewSeparatedScreen> {

  List<String> imagesList = [
    "https://camo.githubusercontent.com/c2fd2f94aa55544327fc8ed8901aedb2eec8e3535243452b43646eb8086efe1a/68747470733a2f2f796176757a63656c696b65722e6769746875622e696f2f73616d706c652d696d616765732f696d6167652d34342e6a7067",
    "https://photographylife.com/wp-content/uploads/2023/05/Nikon-Z8-Official-Samples-00002.jpg",
    "https://sample-videos.com/img/Sample-jpg-image-10mb.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7L4FWGBOO27k7G_ePJb8usxrPDoo_aqGhWA&s",
  ];

  List<int> numbers = [];

  @override
  void initState() {
    super.initState();
    numbers = List.generate(4, (int no) => 1 + no);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listview Separated Screen"),
      ),
      body: ListView.separated(
        itemCount:imagesList.length,
        padding: const EdgeInsets.all(10),
        separatorBuilder:  (BuildContext context, int index){
          return Container(
            height: 10,
            color: Colors.white,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return  Column(
            children: [
              Text("This is an Image ${numbers[index]}"),
              CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: imagesList[index].toString(),
                placeholder: (BuildContext context, String str){
                  return  SizedBox(
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
            ],
          );
        },
      ),
    );
  }
}
