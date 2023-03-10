import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Model/usermodel.dart';

class DataExtraction extends StatefulWidget {
  const DataExtraction({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DataExtractionState createState() => _DataExtractionState();
}

class _DataExtractionState extends State<DataExtraction> {
  late dynamic values = "";
  final List<Tasks> tasks = [];
  final DatabaseReference dbr =
      FirebaseDatabase.instance.ref(FirebaseAuth.instance.currentUser!.uid);

  @override
  void initState() {
    super.initState();
   
    getValues();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),

        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          tasks[index].date!,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          tasks[index].time!,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                       
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: tasks[index].priority == 'High'
                                ? Colors.red[400]
                                : tasks[index].priority == 'Medium'
                                    ? Colors.yellow[700]
                                    : Colors.green[400],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            tasks[index].priority!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                       
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            tasks[index].tasks!,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            deleteData(tasks[index].key!);
                          },
                          child: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void getValues() {
    dbr.onChildAdded.listen((event) {
      setState(() {
        dynamic values = event.snapshot.child("tasks").value;

        tasks.add(Tasks(
            key: event.snapshot.key!,
            date: values[0]['date'],
            email: values[0]['email'],
            priority: values[0]['priority'],
            status: values[0]['status'],
            tasks: values[0]['tasks'],
            time: values[0]['time']));
      });
    });
  }

  void deleteData(String key) {
    dbr.child(key).remove().then((_) {
      setState(() {
        tasks.removeWhere((task) => task.key == key);
      });
    }).catchError((error) => print('Delete failed: $error'));
  }
  

  
}
