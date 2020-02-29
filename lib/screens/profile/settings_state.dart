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

class InitialSettingsState extends SettingsState {
  InitialSettingsState({Settings settings}) : super(settings: settings);
}

class FullNameUpdatedState extends SettingsState {
  FullNameUpdatedState({Settings settings}) : super(settings: settings);
}

class DateOfBirthUpdatedState extends SettingsState {
  DateOfBirthUpdatedState({Settings settings}) : super(settings: settings);
}

class NotifySalesUpdatedState extends SettingsState {
  NotifySalesUpdatedState({Settings settings}) : super(settings: settings);
}

class NotifyArrivalsUpdatedSate extends SettingsState {
  NotifyArrivalsUpdatedSate({Settings settings}) : super(settings: settings);
}

class NotifyDeliveryUpdatedState extends SettingsState {
  NotifyDeliveryUpdatedState({Settings settings}) : super(settings: settings);
}
