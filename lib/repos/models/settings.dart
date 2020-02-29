import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';

class Settings extends Equatable {
  final String fullName;
  final String dateOfBirth;
  final bool notifySales;
  final bool notifyArrivals;
  final bool notifyDelivery;

  Settings(
      {@required this.fullName,
      @required this.dateOfBirth,
      @required this.notifySales,
      @required this.notifyArrivals,
      @required this.notifyDelivery});

  @override
  List<Object> get props =>
      [fullName, dateOfBirth, notifySales, notifyArrivals, notifyDelivery];
}
