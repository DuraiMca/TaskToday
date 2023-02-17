import 'package:flutter/material.dart';




// ignore: camel_case_types

class taskabout extends StatefulWidget {
  final Function(String) onTextChanged;

   const taskabout( {required this.onTextChanged,super.key});

  @override
  // ignore: library_private_types_in_public_api
  _taskaboutState createState() => _taskaboutState();
}

// ignore: camel_case_types
class _taskaboutState extends State<taskabout> {
  TextEditingController taskController = TextEditingController();

    @override
  void initState() {
    super.initState();
     taskController.addListener(() {
      widget.onTextChanged(taskController.text);
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Close the keyboard when the user taps outside of the text field
        FocusScope.of(context).unfocus();
      }, 
    
    child:SizedBox(
        height: 100,
        width: double.infinity,
        child: TextFormField(
         
          controller: taskController,
          onChanged: (value) {
            
          },
          decoration: InputDecoration(
            hintText: "Task about...",
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            floatingLabelStyle: const TextStyle(
                height: 4, color: Color.fromARGB(255, 160, 26, 179)),
            filled: true,
            fillColor: Colors.grey[200],
            prefixIcon: const Icon(Icons.work),
          ),
        )));
  }
}
