import 'package:flutter/material.dart';

class ShowSnackBarWidget extends StatefulWidget {
  const ShowSnackBarWidget({super.key});

  @override
  State<ShowSnackBarWidget> createState() => _ShowSnackBarWidgetState();
}

class _ShowSnackBarWidgetState extends State<ShowSnackBarWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (duration) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Conteúdo da snackbar",
            ),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
