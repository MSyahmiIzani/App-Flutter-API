import 'package:flutter/material.dart';
import 'package:assignment_oct_980324106159/landing_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/landing', // Set the initial route to '/landing'
      routes: {
        '/landing': (context) =>
            const LandingPage(), // Define a route for LandingPage
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
