import 'package:connectivity_plus/connectivity_plus.dart';

class CheckConnection {
  CheckConnection._();

  static Future<bool> isConnected() async {
    return await Connectivity()
        .checkConnectivity()
        .then((value) => !value.contains(ConnectivityResult.none));
  }
}
