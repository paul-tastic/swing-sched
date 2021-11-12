import 'package:flutter/material.dart';
import 'package:swing_sched/screens/appointment_listing.dart';
import 'package:swing_sched/splash.dart';
import 'package:swing_sched/utils/color_swatch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swing Scheduler',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF0D2363)), // Cool Black
        accentColor: createMaterialColor(Color(0xFFb5975a)), // Chinese gold
      ),
      home: Splash(),
      routes: {'/appointments': (ctx) => AppointmentListing()},
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => AppointmentListing(),
        );
      },
    );
  }
}
