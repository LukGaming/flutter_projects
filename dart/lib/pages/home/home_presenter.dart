import 'package:chuva_dart/controllers/activity_controller.dart';
import 'package:chuva_dart/pages/home/home_controller.dart';
import 'package:chuva_dart/pages/home/home_page.dart';
import 'package:chuva_dart/shared/dependencies.dart';
import 'package:flutter/material.dart';

class HomePresenter extends StatefulWidget {
  const HomePresenter({super.key});

  @override
  State<HomePresenter> createState() => _HomePresenterState();
}

class _HomePresenterState extends State<HomePresenter> {
  late HomeController homeController;
  late ActivityController activityController;

  @override
  void initState() {
    super.initState();
    activityController = Dependencies.instance.get();
    homeController = HomeController(activityController: activityController);
    activityController.getActivities();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: activityController,
      builder: (_, __) {
        return HomePage(
          homeController: homeController,
          activityController: activityController,
          formattersController: Dependencies.instance.get(),
        );
      },
    );
  }
}
