import 'dart:io';
import 'package:app_builder/utilities/connectivity_status_enum.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider extends ChangeNotifier{
  ConnectivityStatus? _networkState;

  ConnectivityStatus? get networkState => _networkState;

  ConnectivityProvider() {
    Connectivity()
        .checkConnectivity()
        .then((value) => connectionChange(value));
    Connectivity().onConnectivityChanged.listen(connectionChange);
  }

  Future<void> connectionChange(ConnectivityResult connectivityResult) async {
    print('from connection status $connectivityResult');
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      _networkState = ConnectivityStatus.Mobile;
      notifyListeners();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      _networkState = ConnectivityStatus.WiFi;
      notifyListeners();
    } else {
      _networkState = ConnectivityStatus.Offline;
      print("No Internet Connection");
      notifyListeners();
    }
    if (_networkState != ConnectivityStatus.Offline) {
      _checkConnection(connectivityResult);
    }
  }

  //The test to actually see if there is a connection
  _checkConnection(ConnectivityResult connectivityResult) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // good connection
      } else {
        print("No Internet Connection");
      }
    } on SocketException catch (_) {
      print("No Internet Connection");
    }
  }
}