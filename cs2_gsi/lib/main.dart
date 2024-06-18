import 'package:cs2_gsi/controllers/match_stats_controller.dart';

import 'package:cs2_gsi/models/map_data.dart';

import 'package:cs2_gsi/widgets/show_map_stats_widget.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const MatchConnectionPage(),
    );
  }
}

class MatchConnectionPage extends StatefulWidget {
  const MatchConnectionPage({super.key});

  @override
  State<MatchConnectionPage> createState() => _MatchConnectionPageState();
}

class _MatchConnectionPageState extends State<MatchConnectionPage> {
  final _matchStatsController = MatchStatsController();
  late IO.Socket socket;

  @override
  void initState() {
    _matchStatsController.init();
    super.initState();
    initSocket();
  }

  void initSocket() {
    socket = IO.io("http://192.168.0.4:2626", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket.connect();

    socket.onConnectError((error) => _matchStatsController.throwError());

    socket.on('update', (data) {
      try {
        CurrentMapData matchStats = CurrentMapData.fromJson(data);
        _matchStatsController.updateMatchData(matchStats);
      } catch (e) {
        _matchStatsController.throwError();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map stats"),
      ),
      body: ValueListenableBuilder(
        valueListenable: _matchStatsController,
        builder: (context, state, child) {
          return switch (state) {
            LoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            LoadedMatchStatus() => ShowMapStatsWidget(mapData: state.mapData),
            _ => const Text("Ocorreu um erro")
          };
        },
      ),
    );
  }
}
