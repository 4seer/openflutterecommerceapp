import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:openflutterecommerce/data/fake_model/models/settings.dart';

@immutable
abstract class SettingsState extends Equatable {
  final Settings settings;

  SettingsState({this.settings});

  @override
  List<Object> get props => [settings];
}

@immutable
class SettingsInitialState extends SettingsState {
  SettingsInitialState({Settings settings}) : super(settings: settings);
}

@immutable
class FullNameUpdatedState extends SettingsState {
  FullNameUpdatedState({Settings settings}) : super(settings: settings);
}

@immutable
class DateOfBirthUpdatedState extends SettingsState {
  DateOfBirthUpdatedState({Settings settings}) : super(settings: settings);
}

@immutable
class NotifySalesUpdatedState extends SettingsState {
  NotifySalesUpdatedState({Settings settings}) : super(settings: settings);
}

@immutable
class NotifyArrivalsUpdatedSate extends SettingsState {
  NotifyArrivalsUpdatedSate({Settings settings}) : super(settings: settings);
}

@immutable
class NotifyDeliveryUpdatedState extends SettingsState {
  NotifyDeliveryUpdatedState({Settings settings}) : super(settings: settings);
}

@immutable
class ChangeSettingsErrorState extends SettingsState {
  final String errorMessage;

  ChangeSettingsErrorState({Settings settings, this.errorMessage})
      : super(settings: settings);
  @override
  List<Object> get props => [settings, errorMessage];
}
