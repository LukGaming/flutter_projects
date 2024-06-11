class Player {
  final String name;
  final int observerSlot;
  final String team;
  final String position;
  final String forward;

  Player({
    required this.name,
    required this.observerSlot,
    required this.team,
    required this.position,
    required this.forward,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'],
      observerSlot: json['observer_slot'],
      team: json['team'],
      position: json['position'],
      forward: json['forward'],
    );
  }
}
