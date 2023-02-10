import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebasetools/AuthGate.dart';
import 'firebasetools/firebase_options.dart';


Future<void>main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TaskToday());
}

class TaskToday extends StatelessWidget {
  const TaskToday({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}


