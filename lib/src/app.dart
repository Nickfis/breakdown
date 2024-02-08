import 'package:breakdown/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:breakdown/models/future_events.dart';
import 'package:breakdown/views/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyAppWithTransition extends StatelessWidget {
  final FutureEventsList futureEvents;

  const MyAppWithTransition({Key? key, required this.futureEvents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The data is already loaded at this point
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(
          futureEvents: futureEvents), // Pass the loaded data to MyHomePage
    );
  }
}
