import 'dart:collection';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Model/usermodel.dart';

class UsersData extends StatefulWidget {
  UsersData({super.key});

  @override
  _UsersDataState createState() => _UsersDataState();
}

class _UsersDataState extends State<UsersData> {
  final DatabaseReference dbr =
      FirebaseDatabase.instance.ref(FirebaseAuth.instance.currentUser!.uid);
  dynamic data;
  List<TaskData> taskDataList = [];

  @override
  void initState() {
    super.initState();
    dbr.onChildAdded.forEach((element) {
      setState(() {
        data = element.snapshot.value;
        print(data);
        print("===============================");
        print("11111111111111111111111111111");
        // print(element.snapshot.child('tasks').value);
        print("2222222222222222222222222222");

        //Map<String, dynamic> map = element.snapshot.value as Map<String, dynamic>;
        final value = jsonDecode(jsonEncode(element.snapshot.value));

        Map<String, dynamic> map = value;
        print("VALUE :");
        print(value);

        print(map.keys.toList().first);
        print('tasks : ====');
        print(map.entries.elementAt(0).value);
        print('KEY & VALUES : ====');
        for (var kv in map.entries) {
          print(kv.value);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Text("");
  }
}
