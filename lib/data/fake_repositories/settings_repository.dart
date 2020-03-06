class SettingsRepository {
  Future<void> updateFullName(String fullName) async {
    await Future.delayed(Duration(seconds: 3));
  }

  Future<void> updateDateOfBirth(String dateOfBirth) async {
    await Future.delayed(Duration(seconds: 3));
  }

  Future<void> updateNotifySales(bool notifySales) async {
    await Future.delayed(Duration(seconds: 3));
  }

  Future<void> updateNotifyArrivals(bool notifyArrivals) async {
    await Future.delayed(Duration(seconds: 3));
  }

  Future<void> updateNotifyDelivery(bool notifyDelivery) async {
    await Future.delayed(Duration(seconds: 3));
  }
}
