import 'package:flutter/material.dart';

class AppointmentItem extends StatefulWidget {
  final int id;
  bool isBooked;
  final String apptTime;
  String phoneNumber;
  String name;
  int lessons;

  AppointmentItem({
    required this.id,
    required this.isBooked,
    required this.apptTime,
    required this.phoneNumber,
    required this.name,
    required this.lessons,
  });

  @override
  _AppointmentItemState createState() => _AppointmentItemState();
}

class _AppointmentItemState extends State<AppointmentItem> {
  bookAppointment() {
    print('book appointment logic');
  }

  cancelAppointment() {
    print('cancel appointment logic');

    setState(() {
      widget.isBooked = false;
      widget.name = '';
      widget.phoneNumber = '';
      widget.lessons = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: widget.isBooked ? Colors.lightGreen[200] : Colors.white,
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                widget.apptTime,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
                // textAlign: TextAlign.left,
              ),
              SizedBox(height: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.phoneNumber,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ],
          ),
          // Container(
          //   color: Colors.amber,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Text(
          //         'Previous Lessons',
          //         style: TextStyle(fontSize: 16.0),
          //       ),
          //       Text(widget.isBooked ? widget.lessons.toString() : 'n/a'),
          //     ],
          //   ),
          // ),
          Container(
            width: 70.0,
            child: Column(
              children: [
                widget.isBooked
                    ? GestureDetector(
                        onTap: cancelAppointment,
                        child: Column(
                          children: [
                            Icon(Icons.clear),
                            SizedBox(height: 5.0),
                            Text('Cancel'),
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: bookAppointment,
                        child: Column(
                          children: [
                            Icon(
                              Icons.add,
                            ),
                            Text('Book'),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );

    // return InkWell(
    //   onTap: null,
    //   child: Card(
    //     color: Colors.black,
    //     child: Container(
    //       height: 100,
    //       width: MediaQuery.of(context).size.width * 0.8,
    //       padding: EdgeInsets.all(10),
    //       decoration: BoxDecoration(
    //         color: Colors.amber,
    //         border: Border.all(color: Colors.grey),
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //       child: Row(
    //         children: [
    //           Column(
    //             children: [
    //               Container(
    //                 decoration: BoxDecoration(
    //                   color: Colors.blue,
    //                 ),
    //                 width: MediaQuery.of(context).size.width * 0.6,
    //                 child: Text(
    //                   apptTime,
    //                   style: TextStyle(
    //                       fontSize: 24.0, fontWeight: FontWeight.bold),
    //                   textAlign: TextAlign.left,
    //                 ),
    //               ),
    //               Text(name),
    //               Text(phoneNumber),
    //             ],
    //           ),
    //           Column(),
    //         ],
    //       ),
    //     ),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(11.0),
    //     ),
    //     margin: EdgeInsets.all(10),
    //   ),
    // );
  }
}
