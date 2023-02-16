import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class date_widget extends StatefulWidget {
  Function(String) onDateSelected;

  date_widget({super.key, required this.onDateSelected});

  @override
  // ignore: library_private_types_in_public_api
  _date_widgetState createState() => _date_widgetState();
}

// ignore: camel_case_types
class _date_widgetState extends State<date_widget> {
  String? dateStr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          TextButton(
              onPressed: () {
                const datePickerTheme = DatePickerTheme(
                    headerColor: Colors.orange,
                    backgroundColor: Colors.cyan,
                    itemStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    doneStyle: TextStyle(color: Colors.white, fontSize: 16));
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    theme: datePickerTheme,
                    onChanged: (date) {}, onConfirm: (date) {
                  print(dateStr);
                  DateTime dateTime = DateTime.parse(date.toString()!);
                  String formattedDate =
                      DateFormat('dd/MM/yyyy').format(dateTime);
                  dateStr = formattedDate;
                  widget.onDateSelected(dateStr!);
                }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
              child: Row(
                children: [

                  Icon(Icons.calendar_month_outlined),
                  const Text(
                    'Click to add Due Date:',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              )),
          if (dateStr != null) Text(dateStr!)
        ],
      ),
    );
  }
}
