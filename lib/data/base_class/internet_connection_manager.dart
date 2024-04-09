import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectionManager {
  InternetConnectionManager._();

  static final InternetConnectionManager instance = InternetConnectionManager._();

  bool get isInternetConnected => _isInternetConnected;

  bool get isOffline => _isInternetConnected;

  bool _isInternetConnected = false;

  void initialize() {
    listener((bool internetStatus) {
      if (internetStatus) {
        /// I am connected to a mobile or wifi network.
        _isInternetConnected = true;
      } else {
        /// I am NOT connected to a network.
        _isInternetConnected = false;
      }
    });
  }

  void listener(
    void Function(bool) onConnection, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    Connectivity().onConnectivityChanged.listen(
      (event) {
        if (event == ConnectivityResult.mobile) {
          /// I am connected to a mobile network.
          onConnection(true);
        } else if (event == ConnectivityResult.wifi) {
          /// I am connected to a Wifi.
          onConnection(true);
        } else {
          /// I am NOT connected to a network.
          onConnection(false);
        }
      },
      onDone: onDone,
      onError: onError,
      cancelOnError: cancelOnError,
    );
  }
}
