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
  dynamic? data;
List<Object?>workshopList = [];


  @override
  void initState() {
    super.initState();
    
  }

   
  

  @override
  Widget build(BuildContext context) {
    dbr.onChildAdded.forEach((element) {
      data=element.snapshot.child("tasks").value;
  List<Object?> values =data ;
         values?.forEach((element) {
           
             final json = element as Map<dynamic, dynamic>;
        final message = Tasks.fromJson(json);


        print(message.tasks);
       
                });
       
           });
       
          
          
           
           
         
       return Text("");
         
        
}
}


