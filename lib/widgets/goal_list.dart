import 'package:breakdown/models/future_event.dart';
import 'package:breakdown/models/future_events.dart';
import 'package:breakdown/widgets/goal_card.dart';
import 'package:flutter/material.dart';

class GoalList extends StatelessWidget {
  GoalList({Key? key, required this.futureEvents, required this.removeEvent})
      : super(key: key);
  final FutureEventsList futureEvents;
  Function removeEvent;

  List<Widget> renderGoalCards() {
    List<Widget> goalCardList = [];
    for (FutureEvent event in futureEvents.events) {
      goalCardList.add(GoalCard(event: event));
    }

    return goalCardList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: futureEvents.events.length,
        itemBuilder: (context, index) {
          return Center(
            child: InkWell(
                onTap: () {
                  removeEvent(futureEvents.getElementAtIndex(index));
                },
                child: GoalCard(event: futureEvents.getElementAtIndex(index))),
          );
        });
  }
}
