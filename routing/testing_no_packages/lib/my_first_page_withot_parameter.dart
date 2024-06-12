import 'package:flutter/material.dart';

class PageWithoutParameter extends StatefulWidget {
  const PageWithoutParameter({super.key});

  @override
  State<PageWithoutParameter> createState() => _PageWithoutParameterState();
}

class _PageWithoutParameterState extends State<PageWithoutParameter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page without parameter"),
      ),
      body: const Center(
        child: Text("Page without parameter"),
      ),
    );
  }
}
