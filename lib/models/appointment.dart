class Appointment {
  final int id;
  bool isBooked;
  final String apptTime;
  String phoneNumber;
  String name;
  int lessons;

  Appointment({
    required this.id,
    this.isBooked = false,
    required this.apptTime,
    required this.phoneNumber,
    required this.name,
    this.lessons = 0,
  });
}
