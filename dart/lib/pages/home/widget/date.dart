import 'package:chuva_dart/controllers/activity_controller.dart';
import 'package:chuva_dart/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final HomeController homeController;
  final ActivityController activityController;
  final DateTime currentDate;
  const DateWidget({super.key, required this.homeController, required this.currentDate, required this.activityController});

  @override
  Widget build(BuildContext context) {
    String day = currentDate.day.toString();
    return Stack(
      children: [
        Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                activityController.changeDateSelected(currentDate);
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      day,
                      style: TextStyle(
                        color: activityController.dateSelected == currentDate ? const Color.fromARGB(255, 223, 231, 246) : const Color(0XFF9db6dc),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Visibility(
            visible: activityController.dateSelected == currentDate,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 4,
              color: const Color.fromARGB(255, 28, 62, 110),
            ),
          ),
        ),
      ],
    );
  }
}
