import 'package:flutter/material.dart';

// ignore: camel_case_types
class dropdown extends StatefulWidget {
   final Function(String) onPrioritySelected;

   dropdown({super.key, required this.onPrioritySelected});

  @override
  // ignore: library_private_types_in_public_api
  _dropdownState createState() => _dropdownState();
}

// ignore: camel_case_types
class _dropdownState extends State<dropdown> {

 static  String valueSelected="select Priority";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Colors.grey[200],
      isExpanded: true,
      hint:
      
         Text(valueSelected,style: (const TextStyle(
           color: Colors.black
         ))),
      iconSize: 30.0,
      
      style: const TextStyle(color: Colors.black),
      items: ['High', 'Medium', 'Low'].map(
        (val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        },
      ).toList(),
      onChanged: (val) {
        setState(
          () {
           
            if(val!=null){
            valueSelected=val;
            widget.onPrioritySelected(val);
            
            }
          },
        );
      },
    );
    
  }
}