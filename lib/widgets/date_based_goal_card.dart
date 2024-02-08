import 'package:breakdown/models/future_event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateBasedGoalCard extends StatelessWidget {
  final FutureEvent event;
  final DateFormat dateFormat = DateFormat("dd.MM.yyyy");
  DateBasedGoalCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String daysDifference =
        event.date!.difference(DateTime.now()).inDays.toString();
    int totalDuration = event.date!.difference(event.createdAt).inDays;
    int elapsedDuration = DateTime.now().difference(event.createdAt).inDays;
    double progressPercentage = (elapsedDuration / totalDuration).clamp(0, 1);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: 300,
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              event.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 18),
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
                  Text(
                    dateFormat.format(event.createdAt ?? DateTime.now()),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    dateFormat.format(event.date ?? DateTime.now()),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ]),
            Center(
              child: Text(
                '$daysDifference days to go!',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
            )
          ]),
    );
  }
}
