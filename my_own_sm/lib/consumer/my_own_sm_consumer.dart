import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:my_own_sm/base/state_managment/my_own_sm.dart';

class MyOwnSmConsumer extends StatefulWidget {
  final MyOwnSm listenable;
  final Widget Function(BuildContext context) builder;
  const MyOwnSmConsumer({
    super.key,
    required this.listenable,
    required this.builder,
  });

  @override
  State<MyOwnSmConsumer> createState() => _MyOwnSmConsumerState();
}

class _MyOwnSmConsumerState extends State<MyOwnSmConsumer> {
  @override
  void initState() {
    super.initState();
    widget.listenable.addListener(listener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _findController(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.listenable.removeListener(listener);
  }

  void listener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext thisContext) {
    return widget.builder(context);
  }

  MyOwnSm? _findController(BuildContext context) {
    MyOwnSm? controller;

    // Traverse the widget tree upwards to find a class that extends MyOwnSm
    void visitor(Element element) {
      print(element);
      if (element.widget is MyOwnSm) {
        controller = element.widget as MyOwnSm;
      } else {
        element.visitChildElements(visitor);
      }
    }

    // Start visiting from the root of the current context
    context.visitChildElements(visitor);

    return controller;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    print("properties: $properties");
    // TODO: implement debugFillProperties
    super.debugFillProperties(properties);
  }
}
