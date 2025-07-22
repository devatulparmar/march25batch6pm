import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:march25batch6pm/model/user_list_model.dart';
import 'package:march25batch6pm/utils/const.dart';

class ListviewScreen extends StatefulWidget {
  const ListviewScreen({super.key});

  @override
  State<ListviewScreen> createState() => _ListviewScreenState();
}

class _ListviewScreenState extends State<ListviewScreen> {
  String s = "Hello";
  String supportLink = "";
  int pageNo = 0;
  List myList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  List imagesList = [
    "https://camo.githubusercontent.com/c2fd2f94aa55544327fc8ed8901aedb2eec8e3535243452b43646eb8086efe1a/68747470733a2f2f796176757a63656c696b65722e6769746875622e696f2f73616d706c652d696d616765732f696d6167652d34342e6a7067",
    "https://photographylife.com/wp-content/uploads/2023/05/Nikon-Z8-Official-Samples-00002.jpg",
    "https://sample-videos.com/img/Sample-jpg-image-10mb.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7L4FWGBOO27k7G_ePJb8usxrPDoo_aqGhWA&s",
  ];

  List<UserModel> userList = [];
  List _tempList = [];

  Future _getData() async {
    try {
      Uri uriLink = Uri.parse("https://reqres.in/api/users?page=2");
      Map<String, String> header = {
        "x-api-key": "reqres-free-v1",
      };
      var result = await http.get(uriLink, headers: header);
      debugPrint("statusCode = ${result.statusCode}");
      if (result.statusCode == successStatusCode) {
        var decodedJsonData = jsonDecode(result.body);
        _tempList = decodedJsonData["data"] as List;
        pageNo = decodedJsonData["page"];
        supportLink = decodedJsonData["support"]["url"];
        userList = _tempList
            .map((dynamic element) => UserModel.fromJson(element))
            .toList();
        setState(() {});
        debugPrint(_tempList.toString());
      } else if (result.statusCode == unauthorizedStatusCode) {
        /// show snack bar
      }
    } catch (error) {
      debugPrint("Error at $error");
      // show snack bar
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview Screen page no = $pageNo"),
      ),
      body: userList.isNotEmpty
          ? ListView(
              children: [
                Text(supportLink.toString()),
                ListView.builder(
                  itemCount: userList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: userList[index].userImage.toString(),
                              placeholder: (BuildContext context, String str) {
                                return CircularProgressIndicator(
                                  color: Colors.green,
                                  strokeWidth: 5,
                                  backgroundColor: Colors.black,
                                );
                              },
                            ),
                          ),
                          Text("User ID : ${userList[index].id}"),
                          Text("Email : ${userList[index].email}"),
                          Text("First Name : ${userList[index].firstName}"),
                          Text("Last Name : ${userList[index].lastName}"),
                        ],
                      ),
                    );
                  },
                ),
              ],
            )
          : const Center(
              child: Text("No data Found."),
            ),
    );
  }
}
