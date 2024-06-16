class PlayerData {
  final String name;
  final int observerSlot;
  final String team;
  final MatchStats matchStats;
  final Position position;
  final Forward forward;
  final PlayerState state;
  final Weapons? weapons;

  PlayerData({
    required this.name,
    required this.observerSlot,
    required this.team,
    required this.matchStats,
    required this.position,
    required this.forward,
    required this.state,
    required this.weapons,
  });

  factory PlayerData.fromJson(Map<String, dynamic> json) {
    return PlayerData(
      name: json['name'],
      observerSlot: json['observer_slot'],
      team: json['team'],
      matchStats: MatchStats.fromJson(json['match_stats']),
      position: Position.fromJson(json['position']),
      forward: Forward.fromJson(json['forward']),
      state: PlayerState.fromJson(json['state']),
      weapons: Weapons.fromJson(json['weapons']),
    );
  }
}

class MatchStats {
  final int kills;
  final int assists;
  final int deaths;
  final int mvps;
  final int score;

  MatchStats({
    required this.kills,
    required this.assists,
    required this.deaths,
    required this.mvps,
    required this.score,
  });

  factory MatchStats.fromJson(Map<String, dynamic> json) {
    return MatchStats(
      kills: json['kills'],
      assists: json['assists'],
      deaths: json['deaths'],
      mvps: json['mvps'],
      score: json['score'],
    );
  }
}

class Position {
  final double x;
  final double y;
  final double z;

  Position({
    required this.x,
    required this.y,
    required this.z,
  });

  factory Position.fromJson(String json) {
    var positions = json.split(',');
    return Position(
      x: double.parse(positions[0]),
      y: double.parse(positions[1]),
      z: double.parse(positions[2]),
    );
  }
}

class Forward {
  final double x;
  final double y;
  final double z;

  Forward({
    required this.x,
    required this.y,
    required this.z,
  });

  factory Forward.fromJson(String forward) {
    var forwards = forward.split(",");

    return Forward(
      x: double.parse(forwards[0]),
      y: double.parse(forwards[1]),
      z: double.parse(forwards[2]),
    );
  }
}

class PlayerState {
  final int health;
  final int armor;
  final bool helmet;
  final int flashed;
  final int smoked;
  final int burning;
  final int money;
  final int roundKills;
  final int roundKillHs;
  final int roundTotalDmg;
  final int equipValue;

  PlayerState({
    required this.health,
    required this.armor,
    required this.helmet,
    required this.flashed,
    required this.smoked,
    required this.burning,
    required this.money,
    required this.roundKills,
    required this.roundKillHs,
    required this.roundTotalDmg,
    required this.equipValue,
  });

  factory PlayerState.fromJson(Map<String, dynamic> json) {
    return PlayerState(
      health: json['health'],
      armor: json['armor'],
      helmet: json['helmet'],
      flashed: json['flashed'],
      smoked: json['smoked'],
      burning: json['burning'],
      money: json['money'],
      roundKills: json['round_kills'],
      roundKillHs: json['round_killhs'],
      roundTotalDmg: json['round_totaldmg'],
      equipValue: json['equip_value'],
    );
  }
}

class Weapons {
  final Weapon? weapon0;
  final Weapon? weapon1;
  final Weapon? weapon2;
  final Weapon? weapon3;

  Weapons({
    required this.weapon0,
    required this.weapon1,
    required this.weapon2,
    required this.weapon3,
  });

  factory Weapons.fromJson(Map<String, dynamic> json) {
    return Weapons(
      weapon0: json.containsKey('weapon_0')
          ? Weapon.fromJson(json['weapon_0'])
          : null,
      weapon1: json.containsKey('weapon_1')
          ? Weapon.fromJson(json['weapon_1'])
          : null,
      weapon2: json.containsKey('weapon_2')
          ? Weapon.fromJson(json['weapon_2'])
          : null,
      weapon3: json.containsKey('weapon_3')
          ? Weapon.fromJson(json['weapon_3'])
          : null,
    );
  }
}

class Weapon {
  final String name;
  final String paintkit;
  final String type;
  final int? ammoClip;
  final int? ammoClipMax;
  final int? ammoReserve;
  final String state;

  Weapon({
    required this.name,
    required this.paintkit,
    required this.type,
    this.ammoClip,
    this.ammoClipMax,
    this.ammoReserve,
    required this.state,
  });

  factory Weapon.fromJson(Map<String, dynamic> json) {
    return Weapon(
      name: json['name'],
      paintkit: json['paintkit'],
      type: json['type'],
      ammoClip: json['ammo_clip'],
      ammoClipMax: json['ammo_clip_max'],
      ammoReserve: json['ammo_reserve'],
      state: json['state'],
    );
  }
}
