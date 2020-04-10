import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkStatus {
  Future<bool> get isConnected;
}

class NetworkStatusImpl implements NetworkStatus {
  final DataConnectionChecker connectionChecker;

  NetworkStatusImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
