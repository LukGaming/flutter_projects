import 'package:chuva_dart/controllers/activity_controller.dart';
import 'package:chuva_dart/models/activity_model.dart';
import 'package:flutter/material.dart';

class ActivityPageController extends ChangeNotifier {
  late ActivityController activityController;
  ActivityPageController({required this.activityController}) {
    activityController.addListener(notifyListeners);
  }

  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    activityController.removeListener(notifyListeners);
  }

  String formaterDateOfActivity(DateTime dateStart, DateTime dateEnd) {
    String hourStart = '${dateStart.hour.toString().padLeft(2, '0')}:${dateStart.minute.toString().padLeft(2, '0')}h';
    String hourEnd = '${dateEnd.hour.toString().padLeft(2, '0')}:${dateEnd.minute.toString().padLeft(2, '0')}h';

    return '${getNameDayOfWeek(dateStart)} $hourStart - $hourEnd';
  }

  String getNameDayOfWeek(DateTime date) {
    int dayWeek = date.weekday;
    switch (dayWeek) {
      case 1:
        return 'Segunda-feira';
      case 2:
        return 'Terça-feira';
      case 3:
        return 'Quarta-feira';
      case 4:
        return 'Quinta-feira';
      case 5:
        return 'Sexta-feira';
      case 6:
        return 'Sábado';
      case 7:
        return 'Domingo';
      default:
        return 'Desconhecido';
    }
  }

  String formatterDescription(String description) {
    RegExp regex = RegExp(r'<p>(.*?)<\/p>');
    Iterable<Match> matches = regex.allMatches(description);
    String newDescription = '';

    for (Match match in matches) {
      if (match.group(1) is String) {
        newDescription = match.group(1)!;
      }
    }
    return newDescription;
  }

  handleChangeScheduled(ActivityModel activity, Function(String) showMessage) async {
    setIsLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    activityController.changeScheduled(activity.id);
    setIsLoading(false);
    if (activity.isScheduled) {
      showMessage('Não vamos mias te lembrar desta atividade!');
    } else {
      showMessage('Vamos te lembrar desta atividade!');
    }
  }

  setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  List<ActivityModel> getSubActivities(ActivityModel activity) {
    List<ActivityModel> subActivities = activityController.activities.where((element) => element.parent == activity.id).toList();
    return subActivities;
  }

  String? getParentActivity(ActivityModel activity) {
    try {
      ActivityModel activityParent = activityController.activities.firstWhere((element) => element.id == activity.parent);
      return activityParent.title;
    } catch (e) {
      return null;
    }
  }
}
