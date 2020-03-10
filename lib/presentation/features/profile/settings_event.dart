import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class SettingsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class UpdateFullNameEvent extends SettingsEvent {
  final String fullName;

  UpdateFullNameEvent({this.fullName});

  @override
  List<Object> get props => [fullName];

  @override
  String toString() => 'Update FullName Event';
}

@immutable
class UpdateDateOfBirthEvent extends SettingsEvent {
  final String dateOfBirth;

  UpdateDateOfBirthEvent({this.dateOfBirth});

  @override
  List<Object> get props => [dateOfBirth];

  @override
  String toString() => 'Update DateOfBirth Event';
}

@immutable
class UpdateNotifySalesEvent extends SettingsEvent {
  final bool notifySales;

  UpdateNotifySalesEvent({this.notifySales});

  @override
  String toString() => 'Update NotifySales Event';

  @override
  List<Object> get props => [notifySales];
}

@immutable
class UpdateNotifyArrivalsEvent extends SettingsEvent {
  final bool notifyArrivals;

  UpdateNotifyArrivalsEvent({this.notifyArrivals});

  @override
  String toString() => 'Update NotifyArrivals Event';

  @override
  List<Object> get props => [notifyArrivals];
}

@immutable
class UpdateNotifyDeliveryEvent extends SettingsEvent {
  final bool notifyDelivery;

  UpdateNotifyDeliveryEvent({this.notifyDelivery});

  @override
  String toString() => 'Update Delivery Event';

  @override
  List<Object> get props => [notifyDelivery];
}
