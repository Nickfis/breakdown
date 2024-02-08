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
    double unboundedProgressPercentage =
        progress / (event.amountRequired - startingValue);
    double progressPercentage = unboundedProgressPercentage < 0
        ? 0
        : unboundedProgressPercentage > 1
            ? 1
            : unboundedProgressPercentage;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: 300,
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            event.title,
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
              'Currently at $currentValue ${event.unitName}${currentValue != 1 ? 's' : ''}',
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
            children: [
              Text(
                '$startingValue',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '${event.amountRequired}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Center(
            child: Text(
              "Reached ${(progressPercentage * 100).round().toInt()}% of your goal!",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
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
