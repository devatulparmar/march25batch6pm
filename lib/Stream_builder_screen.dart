import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:march25batch6pm/repository/api_repository.dart';
import 'package:march25batch6pm/utils/const.dart';

import 'model/UserDataModel.dart';

class StreamBuilderScreen extends StatefulWidget {
  const StreamBuilderScreen({Key? key}) : super(key: key);

  @override
  State<StreamBuilderScreen> createState() => _StreamBuilderScreenState();
}

class _StreamBuilderScreenState extends State<StreamBuilderScreen> {
  List<UserData> userList = [];
  List tempList = [];
  final StreamController _streamController = StreamController();

  Stream<List<UserData>> getData() async* {
    ///use for set state
    _streamController.sink;
    try {
      Map<String, String> header = {"x-api-key": "reqres-free-v1"};
      var result = await ApiRepository.getAPICall(
          "https://reqres.in/api/users?page=1", header);

      debugPrint("statusCode = ${result.statusCode}");
      if (result.statusCode == successStatusCode) {
        _streamController.sink;
        var decodedJsonData = jsonDecode(result.body);
        tempList = decodedJsonData["data"] as List;
        userList = tempList
            .map((dynamic element) => UserData.fromJson(element))
            .toList();
        setState(() {});
      }
    } catch (error) {
      debugPrint("Error at $error");
      // show snack bar
    }
    yield userList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<UserData>>(
        stream: getData(),
        builder: (BuildContext context, snapShot) {
          return ListView.builder(
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
                        imageUrl: userList[index].avatar.toString(),
                        placeholder: (BuildContext context, String str) {
                          return const CircularProgressIndicator(
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
          );
        },
      ),
    );
  }
}
