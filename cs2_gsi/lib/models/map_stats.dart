class CSMap {
  final String mode;
  final String name;
  final String phase;
  final int? round;
  final int? numMatchesToWinSeries;
  final int? currentSpectators;
  final int? souvenirsTotal;

  CSMap({
    required this.mode,
    required this.name,
    required this.phase,
    required this.round,
    required this.numMatchesToWinSeries,
    required this.currentSpectators,
    required this.souvenirsTotal,
  });

  factory CSMap.fromJson(Map<String, dynamic> json) {
    return CSMap(
      mode: json['mode'],
      name: json['name'],
      phase: json['phase'],
      round: json['round'],
      numMatchesToWinSeries: json['num_matches_to_win_series'],
      currentSpectators: json['current_spectators'],
      souvenirsTotal: json['souvenirs_total'],
    );
  }
}
