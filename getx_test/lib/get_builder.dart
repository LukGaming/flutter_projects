import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/get_controller.dart';

class GetBuilderWidget extends StatelessWidget {
  const GetBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _getController = GetControler();
    return Obx(
      () => Container(),
    );
  }
}
