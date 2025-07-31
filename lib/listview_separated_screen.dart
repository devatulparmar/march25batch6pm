import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:march25batch6pm/model/user_model.dart';
import 'package:march25batch6pm/repository/api_repository.dart';
import 'package:march25batch6pm/utils/const.dart';

import 'model/user_list_model.dart';

class ListviewSeparatedScreen extends StatefulWidget {
  const ListviewSeparatedScreen({super.key});

  @override
  State<ListviewSeparatedScreen> createState() =>
      _ListviewSeparatedScreenState();
}

class _ListviewSeparatedScreenState extends State<ListviewSeparatedScreen> {
  List<String> imagesList = [
    "https://camo.githubusercontent.com/c2fd2f94aa55544327fc8ed8901aedb2eec8e3535243452b43646eb8086efe1a/68747470733a2f2f796176757a63656c696b65722e6769746875622e696f2f73616d706c652d696d616765732f696d6167652d34342e6a7067",
    "https://photographylife.com/wp-content/uploads/2023/05/Nikon-Z8-Official-Samples-00002.jpg",
    "https://sample-videos.com/img/Sample-jpg-image-10mb.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7L4FWGBOO27k7G_ePJb8usxrPDoo_aqGhWA&s",
  ];

  List<int> numbers = [];

  List<UserData> usersList = [];
  List tempList = [];
  late final _pagingController = PagingController<int, UserData>(
    getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) => _getUsersList(pageKey),
  );

  Future<List<UserData>> _getUsersList(int pageKey) async {
    try {
      Map<String, String> header = {"x-api-key": "reqres-free-v1"};
      var result = await ApiRepository.getAPICall(
          "https://reqres.in/api/users?page=$pageKey", header);

      debugPrint("statusCode = ${result.statusCode}");
      if (result.statusCode == successStatusCode) {
        var decodedJsonData = jsonDecode(result.body);
        tempList = decodedJsonData["data"] as List;
        usersList = tempList
            .map((dynamic element) => UserData.fromJson(element))
            .toList();
        setState(() {});
      }
    } catch (error) {
      debugPrint("Error at $error");
      // show snack bar
    }
    return usersList;
  }

  @override
  void initState() {
    super.initState();
    numbers = List.generate(4, (int no) => 1 + no);
    setState(() {});
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listview Separated Screen"),
      ),
      body: PagingListener(
        controller: _pagingController,
        builder: (context, state, fetchNextPage) {
          return PagedListView(
            state: state,
            fetchNextPage: fetchNextPage,
            padding: const EdgeInsets.all(10),
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (BuildContext context, UserData item, int index) {
                return Card(
                  elevation: 35,
                  shadowColor: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: item.avatar.toString(),
                          placeholder: (BuildContext context, String str) {
                            return const SizedBox(
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
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Id : ${item.id}"),
                            Text("Name : ${item.firstName} ${item.lastName}"),
                            Text("Email ${item.email}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
