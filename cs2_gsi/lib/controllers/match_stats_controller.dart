// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:cs2_gsi/models/map_data.dart';

class MatchStatsController extends ValueNotifier<MatchStatusState> {
  MatchStatsController() : super(InitialState());

  void init() {
    value = LoadingState();
  }

  void initMatch(CurrentMapData currentMapData) {
    value = LoadedMatchStatus(currentMapData);
  }

  void updateMatchData(CurrentMapData currentMapData) {
    value = LoadedMatchStatus(currentMapData);
  }

  void throwError() {
    value = ErrorState(error: "Ocorreu um erro ao carregar dados");
  }
}

abstract class MatchStatusState {}

class InitialState extends MatchStatusState {}

class LoadingState extends MatchStatusState {}

class LoadedMatchStatus extends MatchStatusState {
  final CurrentMapData mapData;
  LoadedMatchStatus(this.mapData);
}

class ErrorState extends MatchStatusState {
  String error;
  ErrorState({
    required this.error,
  });

  ErrorState copyWith({
    String? error,
  }) {
    return ErrorState(
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
    };
  }

  factory ErrorState.fromMap(Map<String, dynamic> map) {
    return ErrorState(
      error: map['error'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorState.fromJson(String source) =>
      ErrorState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ErrorState(error: $error)';

  @override
  bool operator ==(covariant ErrorState other) {
    if (identical(this, other)) return true;

    return other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
