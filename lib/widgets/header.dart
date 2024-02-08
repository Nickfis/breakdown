import 'package:breakdown/views/add_goal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  Header({Key? key, required this.onAddEvent}) : super(key: key);
  DateFormat dateFormat = DateFormat("dd.MM.yyyy");
  Function onAddEvent;

  @override
  Widget build(BuildContext context) {
    String formattedDate = dateFormat.format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(formattedDate,
              style: const TextStyle(color: Colors.white, fontSize: 30)),
          IconButton(
            iconSize: 36,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddGoal(onAddEvent: onAddEvent)));
            },
            icon: const Icon(Icons.add_circle_outline, color: Colors.white),
          )
        ],
      ),
    );
  }
}
