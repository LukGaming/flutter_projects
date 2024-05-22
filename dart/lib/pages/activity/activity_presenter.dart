import 'package:chuva_dart/controllers/activity_controller.dart';
import 'package:chuva_dart/models/activity_model.dart';
import 'package:chuva_dart/pages/activity/activity_page.dart';
import 'package:chuva_dart/pages/activity/activity_page_controller.dart';
import 'package:chuva_dart/shared/dependencies.dart';
import 'package:flutter/material.dart';

class ActivityPresenter extends StatefulWidget {
  final ActivityModel activity;
  const ActivityPresenter({super.key, required this.activity});

  @override
  State<ActivityPresenter> createState() => _ActivityPresenterState();
}

class _ActivityPresenterState extends State<ActivityPresenter> {
  late ActivityPageController activityPageController;
  late ActivityController activityController;
  late int indexActivity;

  @override
  void initState() {
    super.initState();
    activityController = Dependencies.instance.get();
    activityPageController = ActivityPageController(activityController: activityController);
    indexActivity = activityController.activities.indexWhere((element) => element.id == widget.activity.id);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: activityPageController,
      builder: (_, __) {
        return ActivityPage(
          activity: activityController.activities[indexActivity],
          activityController: activityController,
          activityPageController: activityPageController,
          formattersController: Dependencies.instance.get(),
        );
      },
    );
  }
}
