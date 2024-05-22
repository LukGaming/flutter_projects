import 'package:chuva_dart/controllers/activity_controller.dart';
import 'package:chuva_dart/models/activity_model.dart';
import 'package:chuva_dart/pages/activity/activity_presenter.dart';
import 'package:chuva_dart/controllers/formatters_controller.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final FormattersController formattersController;
  final ActivityController activityController;
  final ActivityModel activity;
  const CardWidget({super.key, required this.activity, required this.activityController, required this.formattersController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityPresenter(activity: activity)));
          },
          child: Container(
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Container(
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                    color: activity.color != null ? activityController.getFromCssColor(activity.color!) : Colors.transparent,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10, right: 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formattersController.formaterDateOfActivity(activity.type, activity.dateStarted, activity.dateEnd)),
                            Visibility(
                              visible: activity.isScheduled,
                              child: const Icon(
                                Icons.bookmark,
                                color: Color(0XFF7c90ac),
                              ),
                            )
                          ],
                        ),
                        Text(
                          activity.title,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          formattersController.formatterPeoples(activity.peoples),
                          style: const TextStyle(
                            color: Color(0XFF959595),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
