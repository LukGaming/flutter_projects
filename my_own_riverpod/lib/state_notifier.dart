import 'package:flutter/material.dart';

class MyWidget extends WidgetSemEstado {
  MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int count = watch(0);

    int count2 = watch(2);

    return Scaffold(
      appBar: AppBar(title: const Text("minha appbar")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(count2.toString()),
          TextButton(
            onPressed: () {
              count + 10;
            },
            child: Text(count.toString()),
          ),
        ],
      ),
    );
  }
}

abstract class WidgetSemEstado extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WidgetSemEstadoState();
  int _valueIndex = 0;

  List<VoidCallback> _listeners = [];

  List<dynamic> _values = [];

  T watch<T>(T value) {
    if (_listeners.length > _valueIndex) {}
    if (_values.contains(_valueIndex)) {
      return _values[_valueIndex];
    } else {
      _values.add(value);
    }

    _valueIndex++;
    return value;
  }

  Widget build(BuildContext context);

  WidgetSemEstado({super.key});
}

class _WidgetSemEstadoState extends State<WidgetSemEstado> {
  @override
  void initState() {
    super.initState();
    listenToChangesInTheParent(); // Adicionando o listener no initState
  }

  void listenToChangesInTheParent() {
    widget._listeners.add(callbackListener);
  }

  void callbackListener() {
    print("Chamando o setState");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(widget._values);
    return widget.build(context);
  }
}

abstract class WidgetComEstadoEComCiclos extends StatefulWidget {
  const WidgetComEstadoEComCiclos({super.key});
}
