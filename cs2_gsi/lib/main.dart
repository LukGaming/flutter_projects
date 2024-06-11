import 'package:cs2_gsi/enums/map_enum.dart';
import 'package:cs2_gsi/functions/map_stats.dart';
import 'package:cs2_gsi/models/gsi_data.dart';
import 'package:cs2_gsi/models/map_data.dart';
import 'package:cs2_gsi/models/map_stats.dart';
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
  late IO.Socket socket;

  CSMap? mapStat;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSocket();
  }

  void initSocket() {
    socket = IO.io("http://192.168.0.6:2626", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket.connect();

    print(socket.connected);

    socket.onConnectError((error) => print(error));

    socket.on('update', (data) {
      mapStat = getMapStatFromJson(data['map']);

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map stats"),
      ),
      body: mapStat == null
          ? const Center(child: CircularProgressIndicator())
          : ShowMapStatsWidget(mapStats: mapStat!),
    );
  }
}