import 'dart:developer';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';

class NetworkUtils {
  static Future<bool> isAvaiable() async {
    final connectivity = GetIt.I<Connectivity>();
    final result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  static Future<bool> isConnect() async {
    if (await isAvaiable()) {
      try {
        final result = await InternetAddress.lookup('example.com');
        return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      } catch (e) {
        log(e);
        return false;
      }
    } else {
      return false;
    }
  }
}
