import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/repos/models/settings.dart';
import 'package:openflutterecommerce/screens/profile/settings_event.dart';
import 'package:openflutterecommerce/screens/profile/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
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
      yield FullNameUpdatedState(settings: newSettings);
    } else if (event is UpdateDateOfBirthEvent) {
      newSettings.dateOfBirth = event.dateOfBirth;
      yield DateOfBirthUpdatedState(settings: newSettings);
    } else if (event is UpdateNotifySalesEvent) {
      newSettings.notifySales = !state.settings.notifySales;
      yield NotifySalesUpdatedState(settings: newSettings);
    } else if (event is UpdateNotifyArrivalsEvent) {
      newSettings.notifyArrivals = !state.settings.notifyArrivals;
      yield NotifyArrivalsUpdatedSate(settings: newSettings);
    } else if (event is UpdateNotifyDeliveryEvent) {
      newSettings.notifyDelivery = !state.settings.notifyDelivery;
      yield NotifyDeliveryUpdatedState(settings: newSettings);
    }
  }
}
