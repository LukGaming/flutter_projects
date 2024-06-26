import 'package:flutter/material.dart';
import 'package:flutter_core/core/infra/injector_imp.dart';
import 'package:flutter_core/core/presentation/controllers/messaging_controller.dart';

class ShowSnackBarWidget extends StatefulWidget {
  final Widget child;
  const ShowSnackBarWidget({super.key, required this.child});

  @override
  State<ShowSnackBarWidget> createState() => _ShowSnackBarWidgetState();
}

class _ShowSnackBarWidgetState extends State<ShowSnackBarWidget> {
  final _messageController = DependencyInjector().get<MessagingController>();
  @override
  void initState() {
    _messageController.addListener(messageCallback);
    super.initState();
  }

  void messageCallback() {
    final message = _messageController.value;
    if (message is ShowSnackbarMessage) {
      if (message.closePreviousSnackBar) {
        ScaffoldMessenger.of(context).clearSnackBars();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        message.snackBar,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
