import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Datepicker extends StatelessWidget {
  final DateTime pickedDate;
  final Function(DateTime) onChange;
  const Datepicker(
      {super.key, required this.pickedDate, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CupertinoTheme(
        data: const CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 19,
            ),
          ),
        ),
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: DateTime.now(),
          onDateTimeChanged: onChange,
        ),
      ),
    );
  }
}
