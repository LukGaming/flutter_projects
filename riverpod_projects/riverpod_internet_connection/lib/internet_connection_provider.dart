import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final internetConnectionProvider =
    StreamProvider<ConnectionStatus>((ref) async* {
  yield getConnectivityStatus(await Connectivity().checkConnectivity());

  final StreamController<ConnectionStatus> streamController =
      StreamController();
  Connectivity().onConnectivityChanged.listen((status) {
    streamController.add(getConnectivityStatus(status));
  });

  await for (final value in streamController.stream) {
    print(value);
    yield value;
  }
});

enum ConnectionStatus { mobile, wifi, disconnected }

ConnectionStatus getConnectivityStatus(List<ConnectivityResult> result) {
  bool hasConnection = result.contains(ConnectivityResult.mobile) ||
      result.contains(ConnectivityResult.wifi);
  if (hasConnection) {
    print("hasConnection: $hasConnection");
    bool isMobile = result.contains(ConnectivityResult.mobile) &&
        !result.contains(ConnectivityResult.wifi);
    if (isMobile) {
      return ConnectionStatus.mobile;
    } else {
      return ConnectionStatus.wifi;
    }
  } else {
    return ConnectionStatus.disconnected;
  }
}
