import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:openflutterecommerce/repos/models/settings.dart';

@immutable
abstract class SettingsState extends Equatable {
  final Settings settings;

  SettingsState({this.settings});

  @override
  List<Object> get props => [settings];
}

class InitialSettingsState extends SettingsState {}

class FullNameUpdatedState extends SettingsState {}

class DateOfBirthUpdatedState extends SettingsState {}

class NotifySalesUpdatedState extends SettingsState {}

class NotifyArrivalsUpdatedSate extends SettingsState {}

class NotifyDeliveryUpdatedState extends SettingsState {}
