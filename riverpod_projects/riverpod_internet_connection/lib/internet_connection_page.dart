import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_internet_connection/internet_connection_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((duration) {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(internetConnectionProvider, (prev, next) {
      print("rebuildando");
      next.when(
        data: (data) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              key: const Key("snackbar"),
              duration: const Duration(seconds: 4),
              content: Text(
                "Status da conexão: $data",
              ),
            ),
          );
        },
        error: (e, stackTrace) => {},
        loading: () => {},
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Internet Connection test"),
      ),
      body: Consumer(builder: (context, ref, child) {
        final connectionStatus = ref.watch(internetConnectionProvider);
        switch (connectionStatus) {
          case AsyncData(:final value):
            switch (value) {
              case ConnectionStatus.mobile:
                return const ConnectedToMobile();
              case ConnectionStatus.wifi:
                return const ConnectedToWifiWidget();
              default:
                return const DisconnectedWidget();
            }
          case AsyncError(:final error):
            return Center(
              child: Text(error.toString()),
            );
          default:
            return Container();
        }
      }),
    );
  }
}

class ConnectedToMobile extends StatelessWidget {
  const ConnectedToMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.signal_wifi_0_bar, size: 60),
          Text(
            "Conectado aos dados móveis!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class ConnectedToWifiWidget extends StatelessWidget {
  const ConnectedToWifiWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.signal_wifi_0_bar, size: 60),
          Text(
            "Conectado ao wifi!",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class DisconnectedWidget extends StatelessWidget {
  const DisconnectedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.signal_wifi_connected_no_internet_4_rounded, size: 60),
          Text("Internet Desconectada!", style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
