import 'dart:io';
import 'package:breakdown/models/future_event.dart';
import 'package:breakdown/widgets/custom_unit_goal_card.dart';
import 'package:breakdown/widgets/date_based_goal_card.dart';
import 'package:flutter/material.dart';

class GoalCard extends StatelessWidget {
  final FutureEvent event;
  final Function(CustomUnitEvent, bool) updateCustomEventProgress;

  GoalCard({
    Key? key,
    required this.event,
    required this.updateCustomEventProgress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // background container
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: 300,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green.shade300,
              image: event.imagePath != null
                  ? DecorationImage(
                      image: FileImage(File(event.imagePath!)),
                      fit: BoxFit.cover)
                  : null),
        ),
        // black overlay
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: 300,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(120, 0, 0, 0)),
        ),
        // text container
        event is CustomUnitEvent
            ? CustomUnitGoalCard(
                event: event as CustomUnitEvent,
                updateCustomEventProgress: updateCustomEventProgress)
            : DateBasedGoalCard(event: event)
      ],
    );
  }
}
