// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../main.dart';

class appbardesign extends StatefulWidget {
   appbardesign({super.key});

  @override
  _appbardesignState createState() => _appbardesignState();
}

class _appbardesignState extends State<appbardesign> {
  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text("TaskToday"), actions: [
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TaskToday(),
                ));
              },
              child: const Text("signout"))
        ]);
  }
}