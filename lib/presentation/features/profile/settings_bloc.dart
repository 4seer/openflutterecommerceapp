import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/repositories/fake_repos/settings_repository.dart';
import 'package:openflutterecommerce/domain/entities/user/settings.dart';
import 'package:openflutterecommerce/presentation/features/profile/settings_event.dart';
import 'package:openflutterecommerce/presentation/features/profile/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsBloc({@required this.settingsRepository})
      : assert(settingsRepository != null),
        super(SettingsInitialState(
            settings: UserSettingsEntity(
                fullName: '',
                dateOfBirth: '',
                notifySales: false,
                notifyArrivals: false,
                notifyDelivery: false)));

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    var newSettings = state.settings;

    if (event is UpdateFullNameEvent) {
      newSettings.fullName = event.fullName;
      try {
        await settingsRepository.updateFullName(newSettings.fullName);
        yield FullNameUpdatedState(settings: newSettings);
      } catch (error) {
        yield ChangeSettingsErrorState(
            settings: newSettings, errorMessage: error);
      }
    } else if (event is UpdateDateOfBirthEvent) {
      newSettings.dateOfBirth = event.dateOfBirth;
      try {
        await settingsRepository.updateDateOfBirth(newSettings.dateOfBirth);
        yield DateOfBirthUpdatedState(settings: newSettings);
      } catch (error) {
        yield ChangeSettingsErrorState(
            settings: newSettings, errorMessage: error);
      }
    } else if (event is UpdateNotifySalesEvent) {
      newSettings.notifySales = event.notifySales;
      try {
        await settingsRepository.updateNotifySales(newSettings.notifySales);
        yield NotifySalesUpdatedState(settings: newSettings);
      } catch (error) {
        yield ChangeSettingsErrorState(
            settings: newSettings, errorMessage: error);
      }
    } else if (event is UpdateNotifyArrivalsEvent) {
      newSettings.notifyArrivals = event.notifyArrivals;
      try {
        await settingsRepository
            .updateNotifyArrivals(newSettings.notifyArrivals);
        yield NotifyArrivalsUpdatedSate(settings: newSettings);
      } catch (error) {
        yield ChangeSettingsErrorState(
            settings: newSettings, errorMessage: error);
      }
    } else if (event is UpdateNotifyDeliveryEvent) {
      newSettings.notifyDelivery = event.notifyDelivery;
      try {
        await settingsRepository
            .updateNotifyDelivery(newSettings.notifyDelivery);
        yield NotifyDeliveryUpdatedState(settings: newSettings);
      } catch (error) {
        yield ChangeSettingsErrorState(
            settings: newSettings, errorMessage: error);
      }
    }
  }
}
