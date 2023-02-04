

abstract class NetworkStatus {
  Future<bool> get isConnected;
}

class NetworkStatusImpl implements NetworkStatus {

  NetworkStatusImpl();

  @override
  Future<bool> get isConnected => Future.value(true);
}
