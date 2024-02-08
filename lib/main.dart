import 'package:breakdown/models/future_event.dart';
import 'package:breakdown/models/future_events.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FutureEventAdapter());
  Hive.registerAdapter(CustomUnitEventAdapter());
  Hive.registerAdapter(ProgressRecordAdapter());

  final FutureEventsList futureEvents = FutureEventsList();
  await futureEvents.init(); // Initialize and load events
  runApp(MyAppWithTransition(
      futureEvents: futureEvents)); // Pass the loaded events
}
