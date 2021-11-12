import 'package:flutter/material.dart';
import 'package:swing_sched/dummy_data/appointment_data.dart';
import 'package:swing_sched/models/appointment.dart';
import 'package:swing_sched/widgets/appointment_item.dart';

class AppointmentListing extends StatefulWidget {
  static const routeName = '/appointment-listing';

  @override
  _AppointmentListingState createState() => _AppointmentListingState();
}

class _AppointmentListingState extends State<AppointmentListing> {
  List<Appointment> appointments = APPOINTMENT_DATA;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image.asset('assets/images/pga-logo.png'),
        ),
        centerTitle: true,
        title: Text(
          'Swing Scheduler',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Today\'s Appointments',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              color: Theme.of(context).accentColor,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: appointments.length,
                  itemBuilder: (ctx, index) {
                    //return Text('timeslot: $index');
                    return AppointmentItem(
                      id: appointments[index].id,
                      isBooked: appointments[index].isBooked,
                      apptTime: appointments[index].apptTime,
                      phoneNumber: appointments[index].phoneNumber,
                      name: appointments[index].name,
                      lessons: appointments[index].lessons,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
