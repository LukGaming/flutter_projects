import 'package:chuva_dart/controllers/activity_controller.dart';
import 'package:chuva_dart/models/activity_model.dart';
import 'package:chuva_dart/pages/activity/activity_page_controller.dart';
import 'package:flutter/material.dart';

class ButtonChangeScheduled extends StatelessWidget {
  final ActivityModel activity;
  final ActivityPageController activityPageController;
  final ActivityController activityController;
  const ButtonChangeScheduled({super.key, required this.activity, required this.activityPageController, required this.activityController});

  @override
  Widget build(BuildContext context) {
    showMessage(String errorMessage) {
      final snackBar = SnackBar(
        content: Text(errorMessage),
        duration: const Duration(milliseconds: 1500),
      );
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return TextButton(
      onPressed: () => activityPageController.handleChangeScheduled(activity, showMessage),
      style: ElevatedButton.styleFrom(
        backgroundColor: activityPageController.isLoading ? const Color.fromARGB(255, 233, 233, 233) : const Color(0xFF306dc3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          activityPageController.isLoading
              ? Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(3.14),
                  child: const Icon(
                    Icons.replay,
                    color: Color(0xFF888888),
                  ),
                )
              : const Icon(
                  Icons.star,
                  color: Colors.white,
                ),
          const SizedBox(width: 10),
          activityPageController.isLoading
              ? const Text(
                  'Processando...',
                  style: TextStyle(color: Color(0xFF888888)),
                )
              : Text(
                  activity.isScheduled ? 'Remover da sua agenda' : 'Adicionar à sua agenda',
                  style: const TextStyle(color: Colors.white),
                ),
        ],
      ),
    );
  }
}
