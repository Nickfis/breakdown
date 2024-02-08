import 'package:breakdown/models/future_event.dart';
import 'package:breakdown/models/future_events.dart';
import 'package:breakdown/widgets/goal_card.dart';
import 'package:flutter/material.dart';

class GoalList extends StatelessWidget {
  GoalList(
      {Key? key,
      required this.futureEvents,
      required this.removeEvent,
      required this.updateCustomEventProgress})
      : super(key: key);
  final FutureEventsList futureEvents;
  Function removeEvent;
  final Function(CustomUnitEvent, bool) updateCustomEventProgress;

  List<Widget> renderGoalCards() {
    List<Widget> goalCardList = [];
    for (FutureEvent event in futureEvents.events) {
      goalCardList.add(GoalCard(
          event: event, updateCustomEventProgress: updateCustomEventProgress));
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
              onLongPress: () async {
                final selectedValue = await showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(100.0, 200.0, 100.0,
                        100.0), // You can adjust these values according to your needs
                    items: [
                      PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete',
                            style: TextStyle(color: Colors.white)),
                      ),
                      // Add more menu items if needed
                    ],
                    color: Colors.red.shade700);

                if (selectedValue == 'delete') {
                  removeEvent(futureEvents.getElementAtIndex(index));
                }
              },
              child: GoalCard(
                  event: futureEvents.getElementAtIndex(index),
                  updateCustomEventProgress: updateCustomEventProgress),
            ),
          );
        });
  }
}
