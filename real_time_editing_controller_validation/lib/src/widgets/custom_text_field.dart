import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_time_editing_controller_validation/src/objects/leading_validation_icons.dart';
import 'package:real_time_editing_controller_validation/src/objects/prefix_validation_icons.dart';
import 'package:real_time_editing_controller_validation/src/objects/suffix_validation_icons.dart';
import 'package:real_time_editing_controller_validation/src/objects/validation_state.dart';

class CustomTextField extends StatefulWidget {
  final bool? validateOnUserInteraction;
  final PrefixValidationIcons? validationPrefixIcons;
  final SuffixValidationIcons? validationSuffixIcons;
  final ValidationLeadingIcons? validationLeadingIcons;
  final String? Function(String value) validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validatorFunction;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;

  const CustomTextField({
    Key? key,
    required this.validator,
    this.validateOnUserInteraction = true,
    this.validationPrefixIcons,
    this.validationSuffixIcons,
    this.validationLeadingIcons,
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validatorFunction,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  ValidationState validationState = IddleValidation();

  void onUserInteractionCallback(String value) {
    final errorMessage = widget.validator(value);
    if (errorMessage != null) {
      validationState = ErrorValidation(errorMessage);
    } else {
      validationState = SuccessValidation();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      decoration: (widget.decoration ?? const InputDecoration()).copyWith(
        errorText: getValidationMessage(),
        prefixIcon: getPrefixIconBasedOnState(),
        suffixIcon: getSuffixIconBasedOnState(),
        icon: getLeadingIconBasedOnState(),
      ),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      toolbarOptions: widget.toolbarOptions,
      showCursor: widget.showCursor,
      obscuringCharacter: widget.obscuringCharacter,
      obscureText: widget.obscureText,
      autocorrect: widget.autocorrect,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      enableSuggestions: widget.enableSuggestions,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      maxLength: widget.maxLength,
      onChanged: (value) {
        if (widget.validateOnUserInteraction == true) {
          onUserInteractionCallback(value);
        }
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      validator: widget.validatorFunction,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      cursorWidth: widget.cursorWidth,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorColor: widget.cursorColor,
      keyboardAppearance: widget.keyboardAppearance,
      scrollPadding: widget.scrollPadding,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      selectionControls: widget.selectionControls,
      buildCounter: widget.buildCounter,
      scrollPhysics: widget.scrollPhysics,
      autofillHints: widget.autofillHints,
      autovalidateMode: widget.autovalidateMode,
    );
  }

  String? getValidationMessage() {
    final state = validationState;
    if (state is ErrorValidation) {
      return state.errorMessage;
    }
    return null;
  }

  Icon? getPrefixIconBasedOnState() {
    if (widget.validationPrefixIcons != null) {
      if (validationState is IddleValidation) {
        return widget.validationPrefixIcons!.iddleIcon;
      }
      if (validationState is ErrorValidation) {
        return widget.validationPrefixIcons!.errorIcon;
      } else {
        return widget.validationPrefixIcons!.successIcon;
      }
    }
    return null;
  }

  Icon? getSuffixIconBasedOnState() {
    if (widget.validationSuffixIcons != null) {
      if (validationState is IddleValidation) {
        return widget.validationSuffixIcons!.iddleIcon;
      }
      if (validationState is ErrorValidation) {
        return widget.validationSuffixIcons!.errorIcon;
      } else {
        return widget.validationSuffixIcons!.successIcon;
      }
    }
    return null;
  }

  Icon? getLeadingIconBasedOnState() {
    if (widget.validationLeadingIcons != null) {
      if (validationState is IddleValidation) {
        return widget.validationLeadingIcons!.iddleIcon;
      }
      if (validationState is ErrorValidation) {
        return widget.validationLeadingIcons!.errorIcon;
      } else {
        return widget.validationLeadingIcons!.successIcon;
      }
    }
    return null;
  }
}
