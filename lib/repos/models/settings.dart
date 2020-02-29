import 'package:flutter/widgets.dart';

class Settings {
  String fullName;
  String dateOfBirth;
  bool notifySales;
  bool notifyArrivals;
  bool notifyDelivery;

  Settings(
      {@required this.fullName,
      @required this.dateOfBirth,
      @required this.notifySales,
      @required this.notifyArrivals,
      @required this.notifyDelivery});
}
