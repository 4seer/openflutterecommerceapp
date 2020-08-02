import 'package:flutter/widgets.dart';

class UserSettingsEntity {
  String fullName;
  String dateOfBirth;
  bool notifySales;
  bool notifyArrivals;
  bool notifyDelivery;

  UserSettingsEntity(
      {@required this.fullName,
      @required this.dateOfBirth,
      @required this.notifySales,
      @required this.notifyArrivals,
      @required this.notifyDelivery});
}
