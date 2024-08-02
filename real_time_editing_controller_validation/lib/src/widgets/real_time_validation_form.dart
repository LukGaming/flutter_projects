import 'package:flutter/material.dart';
import 'package:real_time_editing_controller_validation/src/controllers/real_time_form_controller.dart';

class RTFormValidator extends StatefulWidget {
  final RTFormController rtFormController;
  final Widget child;
  const RTFormValidator({
    super.key,
    required this.rtFormController,
    required this.child,
  });

  @override
  State<RTFormValidator> createState() => _RTFormValidatorState();
}

class _RTFormValidatorState extends State<RTFormValidator> {
  @override
  Widget build(BuildContext context) {
    return RTFormScope(
      myState: widget.rtFormController,
      child: widget.child,
    );
  }
}

class RTFormScope extends InheritedWidget {
  final RTFormController myState;
  const RTFormScope({
    super.key,
    required this.myState,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    print("maybe this is changing");
    return true;
  }
}
