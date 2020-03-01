import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/repos/models/settings.dart';
import 'package:openflutterecommerce/repos/settings_repository.dart';
import 'package:openflutterecommerce/screens/profile/settings_event.dart';
import 'package:openflutterecommerce/screens/profile/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  SettingsRepository settingsRepository = SettingsRepository();

  SettingsState get initialState => InitialSettingsState(
      settings: Settings(
          fullName: '',
          dateOfBirth: '',
          notifySales: false,
          notifyArrivals: false,
          notifyDelivery: false));

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    Settings newSettings = state.settings;

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
      newSettings.notifySales = !state.settings.notifySales;
      try {
        await settingsRepository.updateNotifySales(newSettings.notifySales);
        yield NotifySalesUpdatedState(settings: newSettings);
      } catch (error) {
        yield ChangeSettingsErrorState(
            settings: newSettings, errorMessage: error);
      }
    } else if (event is UpdateNotifyArrivalsEvent) {
      newSettings.notifyArrivals = !state.settings.notifyArrivals;
      try {
        await settingsRepository
            .updateNotifyArrivals(newSettings.notifyArrivals);
        yield NotifyArrivalsUpdatedSate(settings: newSettings);
      } catch (error) {
        yield ChangeSettingsErrorState(
            settings: newSettings, errorMessage: error);
      }
    } else if (event is UpdateNotifyDeliveryEvent) {
      newSettings.notifyDelivery = !state.settings.notifyDelivery;
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
