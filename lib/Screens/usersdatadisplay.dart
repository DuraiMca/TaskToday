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
      this.setState(() {
        data = element.snapshot.value;;
        Map<TaskData, dynamic> castedData = data
            .map((key, value) => MapEntry(key.toString(), value as dynamic));
        
        castedData.forEach((key, value) {

            Map<String, dynamic> map = {
  'id': key,
  'tasks': value
};
List<String> keys = map.keys.toList();
List<dynamic> values = map.values.toList();

  print(values);
        
  
        }); 
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return const Text("");
  }
}
