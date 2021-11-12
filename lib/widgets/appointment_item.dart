import 'package:flutter/material.dart';
import 'package:swing_sched/utils/phone_number_format.dart';

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
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  MaskedTextController _numberController =
      MaskedTextController(mask: '(000) 000-0000');

  @override
  dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  void bookAppointment() {
    print('book appointment logic');
    AlertDialog bookingForm = AlertDialog(
      title: Text('New booking for ${widget.apptTime}'),
      content: Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value!.length == 0) return 'name cannot be empty';
                },
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                ),
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(height: 24.0),
              TextFormField(
                controller: _numberController,
                validator: (value) {
                  // validate 10 digits (all numbers)
                  if (value!.length < 10) {
                    return 'phone number must be 10 digits.';
                  }
                },
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: 'Phone number',
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          widget.isBooked = true;
                          widget.name = _nameController.text;
                          widget.phoneNumber = _numberController.text;
                          Navigator.pop(context);
                          _nameController.text = '';
                          _numberController.text = '';
                        });
                      }
                    },
                    child: Text('Save'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return bookingForm;
        });
  }

  void confirmDelete(context) async {
    AlertDialog alert = AlertDialog(
      title: Text('Confirm Delete'),
      content: Text(
          'please confirm you wish to delete your ${widget.apptTime} appointment'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              print('** cancel appointment');
              widget.isBooked = false;
              widget.name = '';
              widget.phoneNumber = '';
              widget.lessons = 0;
            });
            Navigator.pop(context);
          },
          child: Text('Delete'),
        )
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.apptTime} ',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.name} ',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '${widget.phoneNumber}',
                          style: TextStyle(fontSize: 12.0),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 70.0,
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                widget.isBooked
                    ? GestureDetector(
                        onTap: () {
                          confirmDelete(context);
                        },
                        child: Column(
                          children: [
                            Icon(Icons.clear),
                            SizedBox(height: 5.0),
                            Text('Delete'),
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
  }
}
