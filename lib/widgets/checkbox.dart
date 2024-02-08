import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool useDate;
  final Function onChange;
  const CustomCheckbox(
      {super.key, required this.useDate, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.white,
          checkboxTheme: CheckboxThemeData(
              fillColor: MaterialStateProperty.all(Colors.white),
              checkColor: MaterialStateProperty.all(Colors.green),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)))),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: 1.5,
              child: Checkbox(
                onChanged: (bool? newValue) {
                  onChange();
                },
                checkColor: Colors.green.shade900,
                value: useDate,
              ),
            ),
            InkWell(
              onTap: () {
                onChange();
              },
              child: const Text(
                "Use a date for the milestone",
                style:
                    TextStyle(color: Colors.white, fontSize: 20.0, height: 1.1),
              ),
            )
          ]),
    );
  }
}
