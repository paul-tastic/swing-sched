import 'package:flutter/material.dart';
import 'package:swing_sched/dummy_data/appointment_data.dart';
import 'package:swing_sched/screens/appointment_listing.dart';
import 'package:swing_sched/utils/color_swatch.dart';

import 'models/appointment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Appointment> _appointments = APPOINTMENT_DATA;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swing Scheduler',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF0D2363)), // Cool Black
        accentColor: createMaterialColor(Color(0xFFCCA600)), // Chinese gold
      ),
      initialRoute: '/',
      routes: {'/': (ctx) => AppointmentListing(_appointments)},
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => AppointmentListing(_appointments),
        );
      },
    );
  }
}
