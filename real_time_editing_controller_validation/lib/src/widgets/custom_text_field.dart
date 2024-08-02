import 'package:flutter/material.dart';
import 'package:real_time_editing_controller_validation/src/objects/prefix_validation_icons.dart';
import 'package:real_time_editing_controller_validation/src/objects/validation_state.dart';

class CustomTextField extends StatefulWidget {
  final bool? validateOnUserInteraction;
  final PrefixValidationIcons? validationPrefixIcons;
  final String? Function(String value) validator;

  const CustomTextField({
    super.key,
    required this.validator,
    this.validateOnUserInteraction,
    this.validationPrefixIcons,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Icon? validationStatePrefixIcon;
  ValidationState validationState = IddleValidation();

  @override
  void initState() {
    if (widget.validationPrefixIcons != null) {
      validationStatePrefixIcon = widget.validationPrefixIcons!.iddleIcon;
    }
    super.initState();
  }

  void onUserInteractionCallback(String value) {
    final errorMessage = widget.validator(value);
    if (errorMessage != null) {
      validationState = ErrorValidation(errorMessage);
      if (widget.validationPrefixIcons != null) {
        validationStatePrefixIcon = widget.validationPrefixIcons!.errorIcon;
      }
    } else {
      validationState = SuccessValidation();
      if (widget.validationPrefixIcons != null) {
        validationStatePrefixIcon = widget.validationPrefixIcons!.successIcon;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: (value) {
            if (widget.validateOnUserInteraction == true) {
              onUserInteractionCallback(value);
            }
          },
          decoration: InputDecoration(
            errorText: getValidationMessage(),
            prefixIcon: validationStatePrefixIcon,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  String? getValidationMessage() {
    final state = validationState;
    if (state is ErrorValidation) {
      return state.errorMessage;
    }
    return null;
  }
}
