import 'package:chuva_dart/controllers/activity_controller.dart';
import 'package:chuva_dart/controllers/formatters_controller.dart';
import 'package:chuva_dart/models/activity_model.dart';
import 'package:chuva_dart/pages/activity/activity_page_controller.dart';
import 'package:chuva_dart/pages/activity/widgets/button_change_scheduled.dart';
import 'package:chuva_dart/pages/activity/widgets/show_people.dart';
import 'package:chuva_dart/utils/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  final FormattersController formattersController;
  final ActivityModel activity;
  final ActivityController activityController;
  final ActivityPageController activityPageController;
  const ActivityPage({
    super.key,
    required this.activity,
    required this.activityController,
    required this.activityPageController,
    required this.formattersController,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(5),
              color: activity.color != null ? activityController.getFromCssColor(activity.color!) : const Color(0xFF306dc3),
              child: Text(
                activity.titleCategory,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            if (activityPageController.getParentActivity(activity) != null)
              Container(
                color: const Color(0xFF306dc3),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Color(0XFFe7e8ee),
                      size: 30,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Essa atividade faz parte de "${activityPageController.getParentActivity(activity)}"',
                        style: const TextStyle(color: Color(0XFFe7e8ee), fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: Color(0xFF306dc3),
                      ),
                      const SizedBox(width: 5),
                      Text(activityPageController.formaterDateOfActivity(activity.dateStarted, activity.dateEnd)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Color(0xFF306dc3),
                      ),
                      const SizedBox(width: 5),
                      Text(activity.location),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ButtonChangeScheduled(
                    activity: activity,
                    activityPageController: activityPageController,
                    activityController: activityController,
                  ),
                  if (activity.description != null) const SizedBox(height: 30),
                  if (activity.description != null)
                    Text(
                      activityPageController.formatterDescription(activity.description!),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  const SizedBox(height: 30),
                  if (activity.peoples != null && activity.peoples!.isNotEmpty)
                    Text(
                      activity.peoples![0].role,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  if (activity.peoples != null && activity.peoples!.isNotEmpty)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: activity.peoples!.map((people) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ShowPeople(
                            people: people,
                          ),
                        );
                      }).toList(),
                    ),
                  if (activityPageController.getSubActivities(activity).isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sub-atividades',
                          style: TextStyle(
                            color: Color(0xFF737373),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: activityPageController.getSubActivities(activity).map((subActivity) {
                            return CardWidget(
                              formattersController: formattersController,
                              activity: subActivity,
                              activityController: activityController,
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
