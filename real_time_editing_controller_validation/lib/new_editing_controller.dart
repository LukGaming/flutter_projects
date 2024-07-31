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
  MyState? myState;
  String? errorText;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (duration) {
        final scope = context.dependOnInheritedWidgetOfExactType<FormScope>();
        if (scope != null) {
          myState = scope.myState;
          scope.myState.addController(widget.controller);
        }
      },
    );
    widget.controller.addListener(onTextChangeCallback);
    super.initState();
  }

  void onTextChangeCallback() {
    errorText = "teste";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("rebuilding");
    return TextFormField(
      onTapAlwaysCalled: true,
      controller: widget.controller,
      onTap: () => {},
      validator: (value) => widget.validator(value!),
      decoration: InputDecoration(
        errorText: errorText,
        border: const OutlineInputBorder(),
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.removeListener(onTextChangeCallback);
    super.dispose();
  }
}
