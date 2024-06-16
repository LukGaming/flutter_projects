import 'package:cs2_gsi/functions/map_stats.dart';

import 'package:cs2_gsi/models/map_stats.dart';
import 'package:cs2_gsi/models/player_data.dart';

class CurrentMapData {
  final CSMap csMap;
  final List<PlayerData> ctPlayers;
  final List<PlayerData> trPlayers;

  CurrentMapData({
    required this.csMap,
    required this.ctPlayers,
    required this.trPlayers,
  });

  factory CurrentMapData.fromJson(Map<String, dynamic> json) {
    var playersFromJson = getPlayersFromJson(json['allplayers']);
    return CurrentMapData(
      csMap: getMapStatFromJson(json['map']),
      ctPlayers: filterCtPlayers(playersFromJson),
      trPlayers: filterTPlayers(playersFromJson),
    );
  }
}
