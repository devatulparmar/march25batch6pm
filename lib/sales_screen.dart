
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextStyle commonTextStyle = const TextStyle(
    color: Colors.white,
  );

  List<String> imageList = [
    "https://images.wallpaperscraft.com/image/single/flowers_cherry_petals_1398676_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_branch_apple_tree_1399383_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_petals_bloom_1303586_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_cherry_petals_1398676_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_branch_apple_tree_1399383_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_petals_bloom_1303586_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_cherry_petals_1398676_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_branch_apple_tree_1399383_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_petals_bloom_1303586_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_petals_bloom_1303586_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_cherry_petals_1398676_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_branch_apple_tree_1399383_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_petals_bloom_1303586_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_petals_bloom_1303586_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_cherry_petals_1398676_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_branch_apple_tree_1399383_1280x720.jpg",
    "https://images.wallpaperscraft.com/image/single/flowers_petals_bloom_1303586_1280x720.jpg",
  ];

  List<String> langNameList = [
    "IN",
    "US",
    "JP",
    "IN",
    "US",
    "JP",
    "IN",
    "US",
    "JP",
    "IN",
    "US",
    "JP",
    "IN",
    "US",
    "JP",
    "IN",
    "US",
    "JP",
    "IN",
    "US",
    "JP",
    "IN",
    "US",
    "JP",
    "IN",
    "US",
    "JP",
  ];

  List<String> ordersList = [
    "15",
    "11",
    "04",
    "15",
    "11",
    "04",
    "15",
    "11",
    "04",
    "15",
    "11",
    "04",
    "15",
    "11",
    "04",
    "15",
    "11",
    "04",
    "15",
    "11",
    "04",
    "15",
    "11",
    "04",
    "15",
    "11",
    "04",
  ];

  List<String> salesList = [
    "44.21k",
    "42.10k",
    "04.78k",
    "44.21k",
    "42.10k",
    "04.78k",
    "44.21k",
    "42.10k",
    "04.78k",
    "44.21k",
    "42.10k",
    "04.78k",
    "44.21k",
    "42.10k",
    "04.78k",
    "44.21k",
    "42.10k",
    "04.78k",
    "44.21k",
    "42.10k",
    "04.78k",
    "44.21k",
    "42.10k",
    "04.78k",
    "44.21k",
    "42.10k",
    "04.78k",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          title: const Text(
            "Sales",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: const [
            Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(""),
                        Text(
                          "Today",
                          style: commonTextStyle,
                        ),
                        Text(
                          "Previous",
                          style: commonTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(""),
                        Text(
                          "05/12/2025",
                          style: commonTextStyle,
                        ),
                        Text(
                          "05/12/2025",
                          style: commonTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lang",
                          style: commonTextStyle,
                        ),
                        Text(
                          "Orders",
                          style: commonTextStyle,
                        ),
                        Text(
                          "Sales",
                          style: commonTextStyle,
                        ),
                        Text(
                          "Orders",
                          style: commonTextStyle,
                        ),
                        Text(
                          "Sales",
                          style: commonTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListView.separated(
                      itemCount: imageList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 1,
                          color: Colors.black,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundImage: NetworkImage(
                                  imageList[index].toString(),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(langNameList[index]),
                              const SizedBox(
                                width: 45,
                              ),
                              Text(ordersList[index]),
                              const SizedBox(
                                width: 45,
                              ),
                              Text(salesList[index]),
                              const Icon(
                                Icons.arrow_downward,
                                color: Colors.red,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 45,
                              ),
                              Text(ordersList[index]),
                              const SizedBox(
                                width: 45,
                              ),
                              Text(salesList[index]),
                            ],
                          ),
                        );
                      },
                    ),
                    Container(
                      height: 1,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          const Text("Total"),
                          const SizedBox(
                            width: 70,
                          ),
                          Text(ordersList[0]),
                          const SizedBox(
                            width: 45,
                          ),
                          Text(salesList[0]),
                          const Icon(
                            Icons.arrow_downward,
                            color: Colors.red,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 45,
                          ),
                          Text(ordersList[0]),
                          const SizedBox(
                            width: 45,
                          ),
                          Text(salesList[0]),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.black,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.blueAccent.shade100,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Monthly Target"),
                                      Text("2.53M"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                color: Colors.yellow.shade100,
                                child:  Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Yearly Target"),
                                      Text("2.53M"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.blueAccent.shade100,
                                child:  Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Monthly Target"),
                                      Text("2.53M"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                color: Colors.yellow.shade100,
                                child:  Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Yearly Target"),
                                      Text("2.53M"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.blueAccent.shade100,
                                child:  Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Monthly Target"),
                                      Text("2.53M"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                color: Colors.yellow.shade100,
                                child:  Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Yearly Target"),
                                      Text("2.53M"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.blueAccent.shade100,
                                child:  Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Monthly Target"),
                                      Text("2.53M"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                color: Colors.yellow.shade100,
                                child:  Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Yearly Target"),
                                      Text("2.53M"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
