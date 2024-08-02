import 'package:flutter/material.dart';
import 'package:real_time_editing_controller_validation/main.dart';

class NewEditingController extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String value) validator;
  const NewEditingController({
    super.key,
    required this.validator,
    required this.controller,
  });

  @override
  State<NewEditingController> createState() => _NewEditingControllerState();
}

class _NewEditingControllerState extends State<NewEditingController> {
  EditingControllersState? myState;
  String? errorText;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (duration) {
        final scope = context.dependOnInheritedWidgetOfExactType<FormScope>();
        if (scope != null) {
          myState = scope.myState;
          scope.myState.addController(widget.controller);
          scope.myState.addListener(onFormValidation);
        }
      },
    );
    super.initState();
  }

  void onFormValidation() {
    errorText = widget.validator(widget.controller.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: (value) {
        errorText = widget.validator(value);
        setState(() {});
      },
      validator: (value) => widget.validator(value!),
      decoration: InputDecoration(
        errorText: errorText,
        border: const OutlineInputBorder(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
