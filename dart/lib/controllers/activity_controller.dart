import 'dart:convert';

import 'package:chuva_dart/models/activity_model.dart';
import 'package:chuva_dart/services/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class ActivityController extends ChangeNotifier {
  final DioService dio;

  ActivityController({required this.dio});

  DateTime dateSelected = DateTime(2023, 11, 26);
  bool clicked = false;
  List<ActivityModel> activities = [];

  List<DateTime> dates = [
    DateTime(2023, 11, 26),
    DateTime(2023, 11, 27),
    DateTime(2023, 11, 28),
    DateTime(2023, 11, 29),
    DateTime(2023, 11, 30),
  ];

  void changeDateSelected(DateTime newDate) {
    dateSelected = newDate;
    notifyListeners();
  }

  void changeClicked(bool newClicked) {
    clicked = newClicked;
    notifyListeners();
  }

  Future getActivities() async {
    List<ActivityModel> dataActivities = [];

    final responseApi1 = await dio.getDio().get('activities.json');
    var jsonDataApi1 = jsonDecode(responseApi1.data);
    for (final activity in jsonDataApi1['data']) {
      dataActivities.add(ActivityModel.fromJson(activity));
    }

    final responseApi2 = await dio.getDio().get('activities-1.json');
    var jsonDataApi2 = jsonDecode(responseApi2.data);
    for (final activity in jsonDataApi2['data']) {
      dataActivities.add(ActivityModel.fromJson(activity));
    }

    activities = dataActivities;
    notifyListeners();
  }

  Color getFromCssColor(String color) {
    return fromCssColor(color);
  }

  List<ActivityModel> getActivityInDay() {
    return activities.where((e) {
      DateTime dateStart = e.dateStarted;
      DateTime dateActivity = DateTime(dateStart.year, dateStart.month, dateStart.day);
      return dateActivity.isAtSameMomentAs(dateSelected);
    }).toList();
  }

  void changeScheduled(int idActivity) {
    int index = activities.indexWhere((activity) => activity.id == idActivity);
    if (index != -1) {
      ActivityModel updatedActivity = activities[index].copyWith(isScheduled: !activities[index].isScheduled);
      activities[index] = updatedActivity;
      notifyListeners();
    }
  }


}
