import 'package:chuva_dart/controllers/activity_controller.dart';
import 'package:chuva_dart/models/activity_model.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final ActivityController activityController;
  HomeController({required this.activityController});

  List<ActivityModel> getActivityInDay() {
    return activityController.activities.where((e) {
      DateTime dateStart = e.dateStarted;
      DateTime dateActivity = DateTime(dateStart.year, dateStart.month, dateStart.day);
      return dateActivity.isAtSameMomentAs(activityController.dateSelected);
    }).toList();
  }
}
