import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class SettingsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateFullNameEvent extends SettingsEvent {
  @override
  String toString() => 'Update FullName Event';
}

class UpdateDateOfBirthEvent extends SettingsEvent {
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
