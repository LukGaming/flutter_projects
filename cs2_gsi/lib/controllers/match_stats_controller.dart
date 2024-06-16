// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cs2_gsi/models/map_data.dart';

class MatchStatsController extends ValueNotifier<MatchStatusState> {
  MatchStatsController() : super(InitialState());

  void init() {
    value = LoadingState();
  }
}

abstract class MatchStatusState {}

class InitialState extends MatchStatusState {}

class LoadingState extends MatchStatusState {}

class LoadedMatchStatus extends MatchStatusState {
  final CurrentMapData mapData;
  LoadedMatchStatus(this.mapData);
}
