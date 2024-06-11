class GSIData {
  final MapData map;
  final ProviderData provider;
  final RoundData round;
  final Map<String, PlayerData> allPlayers;
  final PhaseCountdowns phaseCountdowns;
  final PlayerData player;
  final Previously previously;

  GSIData({
    required this.map,
    required this.provider,
    required this.round,
    required this.allPlayers,
    required this.phaseCountdowns,
    required this.player,
    required this.previously,
  });

  factory GSIData.fromJson(Map<String, dynamic> json) {
    return GSIData(
      map: MapData.fromJson(json['map']),
      provider: ProviderData.fromJson(json['provider']),
      round: RoundData.fromJson(json['round']),
      allPlayers: Map<String, PlayerData>.from(
        json['allplayers'].map((k, v) => MapEntry(k, PlayerData.fromJson(v))),
      ),
      phaseCountdowns: PhaseCountdowns.fromJson(json['phase_countdowns']),
      player: PlayerData.fromJson(json['player']),
      previously: Previously.fromJson(json['previously']),
    );
  }
}

class MapData {
  final String mode;
  final String name;
  final String phase;
  final int round;
  final TeamData teamCt;
  final TeamData teamT;
  final int numMatchesToWinSeries;

  MapData({
    required this.mode,
    required this.name,
    required this.phase,
    required this.round,
    required this.teamCt,
    required this.teamT,
    required this.numMatchesToWinSeries,
  });

  factory MapData.fromJson(Map<String, dynamic> json) {
    return MapData(
      mode: json['mode'],
      name: json['name'],
      phase: json['phase'],
      round: json['round'],
      teamCt: TeamData.fromJson(json['team_ct']),
      teamT: TeamData.fromJson(json['team_t']),
      numMatchesToWinSeries: json['num_matches_to_win_series'],
    );
  }
}

class TeamData {
  final int score;
  final int consecutiveRoundLosses;
  final int timeoutsRemaining;
  final int matchesWonThisSeries;

  TeamData({
    required this.score,
    required this.consecutiveRoundLosses,
    required this.timeoutsRemaining,
    required this.matchesWonThisSeries,
  });

  factory TeamData.fromJson(Map<String, dynamic> json) {
    return TeamData(
      score: json['score'],
      consecutiveRoundLosses: json['consecutive_round_losses'],
      timeoutsRemaining: json['timeouts_remaining'],
      matchesWonThisSeries: json['matches_won_this_series'],
    );
  }
}

class ProviderData {
  final String name;
  final int appid;
  final int version;
  final String steamid;
  final int timestamp;

  ProviderData({
    required this.name,
    required this.appid,
    required this.version,
    required this.steamid,
    required this.timestamp,
  });

  factory ProviderData.fromJson(Map<String, dynamic> json) {
    return ProviderData(
      name: json['name'],
      appid: json['appid'],
      version: json['version'],
      steamid: json['steamid'],
      timestamp: json['timestamp'],
    );
  }
}

class RoundData {
  final String phase;

  RoundData({required this.phase});

  factory RoundData.fromJson(Map<String, dynamic> json) {
    return RoundData(phase: json['phase']);
  }
}

class PlayerData {
  final String? name;
  final int? observerSlot;
  final String? team;
  final String position;
  final String forward;

  PlayerData({
    required this.name,
    required this.observerSlot,
    required this.team,
    required this.position,
    required this.forward,
  });

  factory PlayerData.fromJson(Map<String, dynamic> json) {
    return PlayerData(
      name: json['name'],
      observerSlot: json['observer_slot'],
      team: json['team'],
      position: json['position'],
      forward: json['forward'],
    );
  }
}

class PhaseCountdowns {
  final String? phase;
  final String phaseEndsIn;

  PhaseCountdowns({required this.phase, required this.phaseEndsIn});

  factory PhaseCountdowns.fromJson(Map<String, dynamic> json) {
    return PhaseCountdowns(
      phase: json['phase'],
      phaseEndsIn: json['phase_ends_in'],
    );
  }
}

class Previously {
  final Map<String, PlayerData> allPlayers;
  final PhaseCountdowns phaseCountdowns;

  Previously({
    required this.allPlayers,
    required this.phaseCountdowns,
  });

  factory Previously.fromJson(Map<String, dynamic> json) {
    return Previously(
      allPlayers: Map<String, PlayerData>.from(
        json['allplayers']?.map((k, v) => MapEntry(k, PlayerData.fromJson(v))),
      ),
      phaseCountdowns: PhaseCountdowns.fromJson(json['phase_countdowns']),
    );
  }
}
