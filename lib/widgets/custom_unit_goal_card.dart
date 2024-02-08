import 'package:breakdown/models/future_event.dart';
import 'package:flutter/material.dart';

class CustomUnitGoalCard extends StatelessWidget {
  final CustomUnitEvent event;
  final Function(CustomUnitEvent, bool) updateCustomEventProgress;
  const CustomUnitGoalCard(
      {Key? key, required this.event, required this.updateCustomEventProgress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int startingValue = event.amountAchieved[0].amount;
    int currentValue =
        event.amountAchieved[event.amountAchieved.length - 1].amount;
    int progress = currentValue - startingValue;
    double progressPercentage =
        progress / (event.amountRequired - startingValue);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: 300,
      height: 160,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: <Widget>[
          Text(event.title, style: TextStyle(color: Colors.white)),
          Text('Current value: $currentValue',
              style: TextStyle(color: Colors.white)),
          Text('Starting value: $startingValue',
              style: TextStyle(color: Colors.white)),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
                value: progressPercentage,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                minHeight: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  iconSize: 35,
                  icon: Icon(Icons.remove_circle_outline, color: Colors.white),
                  onPressed: () {
                    updateCustomEventProgress(event, false);
                  }),
              IconButton(
                  iconSize: 35,
                  icon: Icon(Icons.add_circle_outline, color: Colors.white),
                  onPressed: () {
                    updateCustomEventProgress(event, true);
                  }),
            ],
          )
        ],
      ),
    );
  }
}
