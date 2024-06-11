import 'package:cs2_gsi/enums/map_enum.dart';
import 'package:cs2_gsi/models/player_data.dart';

class MapStats {
  Emap map;
  List<PlayerData> ctPlayers;
  List<PlayerData> trPlayers;
  int ctScore;
  int trScore;
  String roundTime;
  int currentRound;
  int totalRounds;
  MapStats({
    required this.map,
    required this.ctPlayers,
    required this.trPlayers,
    required this.ctScore,
    required this.trScore,
    required this.roundTime,
    required this.currentRound,
    required this.totalRounds,
  });
}
