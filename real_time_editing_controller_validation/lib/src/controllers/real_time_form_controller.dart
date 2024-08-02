import 'package:flutter/material.dart';
import 'package:real_time_editing_controller_validation/src/classes/text_controller.dart';

class RTFormController extends ChangeNotifier {
  final List<TextController> _controllers = [];

  void update() {
    notifyListeners();
  }

  void validate() {
    notifyListeners();
  }

  void addController(TextController controller) {
    print("Adicionando controllers");
    _controllers.add(controller);
  }

  void removeController(TextController controller) {
    _controllers.remove(controller);
  }

  bool isFormValid() {
    validate();
    for (int i = 0; i < _controllers.length; i++) {
      if (_controllers[i].controller != null) {
        String? validationError =
            _controllers[i].validator(_controllers[i].controller!.text);
        if (validationError != null) {
          return false;
        }
      }
    }
    return true;
  }
}
