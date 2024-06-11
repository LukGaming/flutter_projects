// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cs2_gsi/models/player_localization.dart';

class PlayerData {
  String name;
  String isAlive;
  int kills;
  int deaths;
  int assists;
  PlayerLocalization? localization;
  PlayerData({
    required this.name,
    required this.isAlive,
    required this.kills,
    required this.deaths,
    required this.assists,
    this.localization,
  });
}
