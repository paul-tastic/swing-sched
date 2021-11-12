import 'package:flutter/material.dart';

import 'screens/appointment_listing.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  void _navigateHome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => AppointmentListing(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/pga-logo.png'),
              SizedBox(height: 20.0),
              Text('Swing Scheduler',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor,
                  )),
              SizedBox(height: 40.0),
              Text('submitted by Paul McNeme',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).accentColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
