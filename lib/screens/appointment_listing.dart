import 'package:flutter/material.dart';
import 'package:swing_sched/models/appointment.dart';
import 'package:swing_sched/widgets/appointment_item.dart';

class AppointmentListing extends StatefulWidget {
  static const routeName = '/appointment-listing';
  //const AppointmentListing({Key? key}) : super(key: key);
  final List<Appointment> appointments;
  AppointmentListing(this.appointments);

  @override
  _AppointmentListingState createState() => _AppointmentListingState();
}

class _AppointmentListingState extends State<AppointmentListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Swing Scheduler'),
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
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              color: Theme.of(context).accentColor,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.appointments.length,
                  itemBuilder: (ctx, index) {
                    //return Text('timeslot: $index');
                    return AppointmentItem(
                      id: widget.appointments[index].id,
                      isBooked: widget.appointments[index].isBooked,
                      apptTime: widget.appointments[index].apptTime,
                      phoneNumber: widget.appointments[index].phoneNumber,
                      name: widget.appointments[index].name,
                      lessons: widget.appointments[index].lessons,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
