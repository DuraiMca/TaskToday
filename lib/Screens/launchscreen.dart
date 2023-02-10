import 'package:flutter/material.dart';
import '../widgets/appbardesign.dart';
import '../widgets/userUIdesign.dart';

class UserInput extends StatefulWidget {
  const UserInput({super.key});

  @override
  _userinputState createState() => _userinputState();
}

class _userinputState extends State<UserInput> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50), child: appbardesign()),
        body: UserUIDesign(),
      ),
    );
  }
}
