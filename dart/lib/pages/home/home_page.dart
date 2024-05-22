import 'package:chuva_dart/controllers/activity_controller.dart';
import 'package:chuva_dart/controllers/formatters_controller.dart';
import 'package:chuva_dart/pages/home/home_controller.dart';
import 'package:chuva_dart/pages/home/widget/app_bar.dart';
import 'package:chuva_dart/utils/widgets/card_widget.dart';
import 'package:chuva_dart/pages/home/widget/date.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController;
  final FormattersController formattersController;
  final ActivityController activityController;
  const HomePage({super.key, required this.homeController, required this.activityController, required this.formattersController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 1),
          Row(
            children: [
              Container(
                height: 50,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const Column(
                  children: [
                    Text(
                      'Nov',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '2023',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color(0XFF306dc3),
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: activityController.dates.length,
                    itemBuilder: (_, index) {
                      return DateWidget(
                        homeController: homeController,
                        currentDate: activityController.dates[index],
                        activityController: activityController,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: homeController.getActivityInDay().map((activity) {
                return CardWidget(
                  formattersController: formattersController,
                  activity: activity,
                  activityController: activityController,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
