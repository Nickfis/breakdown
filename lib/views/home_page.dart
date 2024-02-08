import 'package:breakdown/models/future_events.dart';
import 'package:breakdown/widgets/goal_list.dart';
import 'package:breakdown/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:breakdown/models/future_event.dart';

class MyHomePage extends StatefulWidget {
  final FutureEventsList futureEvents;

  MyHomePage({Key? key, required this.futureEvents}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _addFutureEvent(FutureEvent event) {
    setState(() {
      widget.futureEvents.addEvent(event);
    });
  }

  void _deleteFutureEvent(FutureEvent event) {
    setState(() {
      widget.futureEvents.removeEvent(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF20342E), Color(0xFF04946F)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Header(onAddEvent: _addFutureEvent),
                const Text("Upcoming milestones",
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                Expanded(
                  child: GoalList(
                      futureEvents: widget.futureEvents,
                      removeEvent: _deleteFutureEvent),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
