import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Future<ConnectivityResult> get checkType;
  Stream<ConnectivityResult> get onChangedStream;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  Connectivity _connectivity;

  NetworkInfoImpl(this.connectionChecker) {
    _connectivity = Connectivity();
  }

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  @override
  Future<ConnectivityResult> get checkType => _connectivity.checkConnectivity();

  @override
  Stream<ConnectivityResult> get onChangedStream =>
      _connectivity.onConnectivityChanged;
}
