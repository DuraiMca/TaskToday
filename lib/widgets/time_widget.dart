import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class time_widget extends StatefulWidget {

   final Function(String) onDateSelected;
   const time_widget({super.key, required this.onDateSelected});


  

  @override
  _time_widgetState createState() => _time_widgetState();
}

class _time_widgetState extends State<time_widget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
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
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {

                    widget.onDateSelected(date.toString());
                    print('confirm $date');
                  }, currentTime: DateTime.now());
                },
                child: Text(
                  'Click to add time',
                  style: TextStyle(color: Colors.blue),
                ));
  }
}