import 'package:chuva_dart/controllers/activity_controller.dart';
import 'package:chuva_dart/models/activity_model.dart';
import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  final ActivityController activityController;

  ProfileController({required this.activityController}) {
    activityController.addListener(notifyListeners);
  }

  @override
  void dispose() {
    super.dispose();
    activityController.removeListener(notifyListeners);
  }

  DateTime previousDate = DateTime(1, 1, 1);

  String formatterDateToString(DateTime date) {
    final List<String> daysOfWeekAbbr = ['seg.', 'ter.', 'qua.', 'qui.', 'sex.', 'sab.', 'dom.'];

    String dayOfWeek = daysOfWeekAbbr[date.weekday - 1];

    String dayOfMonth = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();

    return '$dayOfWeek, $dayOfMonth/$month/$year';
  }

  List<ActivityModel> getActivitiesOfPeople(int idPeople) {
    List<ActivityModel> activitiesOfPeople = [];

    for (ActivityModel activity in activityController.activities) {
      bool isParticipating = activity.peoples?.any((element) => element.id == idPeople) ?? false;

      if (isParticipating) {
        activitiesOfPeople.add(activity);
      }
    }

    return activitiesOfPeople;
  }

  bool compareDate(DateTime date1, DateTime date2) {
    DateTime newDate1 = DateTime(date1.year, date1.month, date1.day);

    DateTime newDate2 = DateTime(date2.year, date2.month, date2.day);

    return newDate1 == newDate2;
  }

  setProfileDates(DateTime date) {
    previousDate = date;
    notifyListeners();
  }
}
