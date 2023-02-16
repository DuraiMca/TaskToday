import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class time_widget extends StatefulWidget {


   final Function(String) onDateSelected;
   const time_widget({super.key, required this.onDateSelected});


  

  @override
  // ignore: library_private_types_in_public_api
  _time_widgetState createState() => _time_widgetState();
}

// ignore: camel_case_types
class _time_widgetState extends State<time_widget> {

  String ?time;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
                    onPressed: () {
                      DatePicker.showTime12hPicker(context, showTitleActions: true,
                      theme: const DatePickerTheme(
                              headerColor: Colors.orange,
                              backgroundColor: Colors.cyan,
                              itemStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              doneStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),),
                          onChanged: (date) {
                            
                      }, onConfirm: (date) {
                         
                       DateTime dateTime = DateTime.parse(date.toString()!);
                         String formattedTime = DateFormat('hh:mm a').format(dateTime);

                        widget.onDateSelected(formattedTime);
                        time=formattedTime;
                        print(time);
                      }, currentTime: DateTime.now());
                    },
                    child: Row(
                      children: [
                         Icon(Icons.watch_later),
                        Text(
                          'Click to add Due time:',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    )),
                    if(time!=null)
                    Text(time!)
      ],
    );
  }
}