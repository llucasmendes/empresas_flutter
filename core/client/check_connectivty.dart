import 'package:connectivity/connectivity.dart';

class LocalConnectivity {
  Connectivity _connectivity;

  LocalConnectivity() {
    _connectivity = Connectivity();
  }

  Future<bool> checkConnection() async {
    final result = await _connectivity.checkConnectivity();

    switch (result) {
      case ConnectivityResult.wifi:
        return true;
      case ConnectivityResult.mobile:
        return true;
      case ConnectivityResult.none:
        return false;
      default:
        return true;
    }
  }
}
