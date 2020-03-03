class SettingsRepository {
  Future<void> updateFullName(String fullName) async {
    Future.delayed(Duration(seconds: 3));
  }

  Future<void> updateDateOfBirth(String dateOfBirth) async {
    Future.delayed(Duration(seconds: 3));
  }

  Future<void> updateNotifySales(bool notifySales) async {
    Future.delayed(Duration(seconds: 3));
  }

  Future<void> updateNotifyArrivals(bool notifyArrivals) async {
    Future.delayed(Duration(seconds: 3));
  }

  Future<void> updateNotifyDelivery(bool notifyDelivery) async {
    Future.delayed(Duration(seconds: 3));
  }
}
