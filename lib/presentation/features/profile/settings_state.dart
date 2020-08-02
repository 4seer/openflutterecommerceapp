import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:openflutterecommerce/domain/entities/user/settings.dart';

@immutable
abstract class SettingsState extends Equatable {
  final UserSettingsEntity settings;

  SettingsState({this.settings});

  @override
  List<Object> get props => [settings];
}

@immutable
class SettingsInitialState extends SettingsState {
  SettingsInitialState({UserSettingsEntity settings}) : super(settings: settings);
}

@immutable
class FullNameUpdatedState extends SettingsState {
  FullNameUpdatedState({UserSettingsEntity settings}) : super(settings: settings);
}

@immutable
class DateOfBirthUpdatedState extends SettingsState {
  DateOfBirthUpdatedState({UserSettingsEntity settings}) : super(settings: settings);
}

@immutable
class NotifySalesUpdatedState extends SettingsState {
  NotifySalesUpdatedState({UserSettingsEntity settings}) : super(settings: settings);
}

@immutable
class NotifyArrivalsUpdatedSate extends SettingsState {
  NotifyArrivalsUpdatedSate({UserSettingsEntity settings}) : super(settings: settings);
}

@immutable
class NotifyDeliveryUpdatedState extends SettingsState {
  NotifyDeliveryUpdatedState({UserSettingsEntity settings}) : super(settings: settings);
}

@immutable
class ChangeSettingsErrorState extends SettingsState {
  final String errorMessage;

  ChangeSettingsErrorState({UserSettingsEntity settings, this.errorMessage})
      : super(settings: settings);
  @override
  List<Object> get props => [settings, errorMessage];
}
