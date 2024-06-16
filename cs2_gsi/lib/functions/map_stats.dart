import 'package:cs2_gsi/models/map_stats.dart';
import 'package:cs2_gsi/models/player_data.dart';

CSMap getMapStatFromJson(Map<String, dynamic> json) {
  return CSMap.fromJson(json);
}

List<PlayerData> getPlayersFromJson(Map<String, dynamic> json) {
  List<PlayerData> players = [];
  json.forEach((key, value) {
    PlayerData player = PlayerData.fromJson(value);
    players.add(player);
  });
  return players;
}

List<PlayerData> filterCtPlayers(List<PlayerData> players) {
  return players.where((e) => e.team == "CT").toList();
}

List<PlayerData> filterTPlayers(List<PlayerData> players) {
  return players.where((e) => e.team == "T").toList();
}
