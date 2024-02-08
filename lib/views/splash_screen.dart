import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your app logo or any splash screen content here
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Loading...', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
