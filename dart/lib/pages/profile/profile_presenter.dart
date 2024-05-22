import 'package:chuva_dart/controllers/activity_controller.dart';
import 'package:chuva_dart/controllers/formatters_controller.dart';
import 'package:chuva_dart/models/people_model.dart';
import 'package:chuva_dart/pages/profile/profile_controller.dart';
import 'package:chuva_dart/pages/profile/profile_page.dart';
import 'package:chuva_dart/shared/dependencies.dart';
import 'package:flutter/material.dart';

class ProfilePresenter extends StatefulWidget {
  final PeopleModel people;
  const ProfilePresenter({super.key, required this.people});

  @override
  State<ProfilePresenter> createState() => _ProfilePresenterState();
}

class _ProfilePresenterState extends State<ProfilePresenter> {
  late ProfileController profileController;
  late FormattersController formattersController;
  late ActivityController activityController;

  @override
  void initState() {
    super.initState();
    activityController = Dependencies.instance.get();
    profileController = ProfileController(activityController: activityController);
    formattersController = FormattersController();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: activityController,
      builder: (_, __) {
        return ProfilePage(
          people: widget.people,
          profileController: profileController,
          formattersController: formattersController,
          activityController: activityController,
        );
      },
    );
  }
}
