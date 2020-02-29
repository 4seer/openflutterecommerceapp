import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class SettingsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateFullNameEvent extends SettingsEvent {
  final String fullName;

  UpdateFullNameEvent({this.fullName});

  @override
  List<Object> get props => [fullName];

  @override
  String toString() => 'Update FullName Event';
}

class UpdateDateOfBirthEvent extends SettingsEvent {
  final String dateOfBirth;

  UpdateDateOfBirthEvent({this.dateOfBirth});

  @override
  List<Object> get props => [dateOfBirth];

  @override
  String toString() => 'Update DateOfBirth Event';
}

class UpdateNotifySalesEvent extends SettingsEvent {
  @override
  String toString() => 'Update NotifySales Event';
}

class UpdateNotifyArrivalsEvent extends SettingsEvent {
  @override
  String toString() => 'Update NotifyArrivals Event';
}

class UpdateNotifyDeliveryEvent extends SettingsEvent {
  @override
  String toString() => 'Update Delivery Event';
}
