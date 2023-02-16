import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Model/usermodel.dart';
import '../data_extraction.dart';
import 'date_widget.dart';
import 'dropdown.dart';
import 'textbox_widget.dart';
import 'time_widget.dart';

class UserUIDesign extends StatefulWidget {
  @override
  _UserUIDesignState createState() => _UserUIDesignState();
}

class _UserUIDesignState extends State<UserUIDesign> {
  List<Tasks> tasks = [];
  String? userTaskText;
  String? userDate;
  String? userTime;
  String? userPriority;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.0,
          width: MediaQuery.of(context).size.width,
          child: Card(
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.all(5.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                    width: 120,
                    child: dropdown(
                      onPrioritySelected: (text) {
                        userPriority = text;
                      },
                    ),
                  ),
                ],
              ),
              taskabout(
                onTextChanged: (text) {
                  setState(() {
                    userTaskText = text;
                  });
                },
              ),
              date_widget(
                onDateSelected: (text) {
                  setState(() {
                    userDate = text;
                  });
                },
              ),
              time_widget(
                onDateSelected: (text) {
                  setState(() {
                    userTime = text;
                  });
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (userTaskText != null &&
                        userDate != null &&
                        userTime != null &&userPriority!=null) {
                      addUserTasks(
                          userTaskText, userPriority, userDate, userTime);
                    } else {
                      const snackBar = SnackBar(
                        content: Text('All fields are mandatory'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Align(
                      alignment: Alignment.center, child: Text("Save"))),
            ]),
          ),
        ),
       FadeTransition(
          opacity: AlwaysStoppedAnimation(1.0),
          child: const DataExtraction(),
        ),
      ],
    ));
  }
}

void addUserTasks(
    userTask, userPriorityText, userDateText, userTimeText) async {
  DatabaseReference ref =
      FirebaseDatabase.instance.ref(FirebaseAuth.instance.currentUser!.uid);

  ref.push().set({
    "tasks": [
      {
        "priority": userPriorityText,
        "tasks": userTask,
        "date": userDateText,
        "time": userTimeText,
        "email": FirebaseAuth.instance.currentUser!.email,
        "status": "Added"
      }
    ]
  });
}
