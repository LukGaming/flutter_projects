import 'package:chuva_dart/controllers/activity_controller.dart';
import 'package:chuva_dart/controllers/formatters_controller.dart';
import 'package:chuva_dart/models/people_model.dart';
import 'package:chuva_dart/pages/profile/profile_controller.dart';
import 'package:chuva_dart/pages/profile/widgets/data_people.dart';
import 'package:chuva_dart/utils/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final PeopleModel people;
  final ProfileController profileController;
  final FormattersController formattersController;
  final ActivityController activityController;

  const ProfilePage({
    super.key,
    required this.people,
    required this.profileController,
    required this.formattersController,
    required this.activityController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chuva 💜 Flutter',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () => Navigator.pop(context), // Navigate back on tap
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              DataPeople(people: people),
              if (people.bio != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    const Text(
                      'Bio',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      people.bio!,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              const SizedBox(height: 15),
              const Text(
                'Atividades',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: profileController.getActivitiesOfPeople(people.id).map((activity) {
                      bool dateIsEquals = profileController.compareDate(activity.dateStarted, profileController.previousDate);
                      profileController.setProfileDates(activity.dateStarted);

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!dateIsEquals)
                            Text(
                              profileController.formatterDateToString(activity.dateStarted),
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          CardWidget(
                            formattersController: formattersController,
                            activity: activity,
                            activityController: activityController,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
