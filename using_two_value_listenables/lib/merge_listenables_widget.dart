import 'package:flutter/widgets.dart';

class MergeValueListenables extends StatefulWidget {
  final List<Listenable> listeners;
  final Widget Function(BuildContext context) builder;

  const MergeValueListenables({
    Key? key,
    required this.listeners,
    required this.builder,
  }) : super(key: key);

  @override
  State<MergeValueListenables> createState() => _MergeValueListenablesState();
}

class _MergeValueListenablesState extends State<MergeValueListenables> {
  Listenable? mergedListenable;

  @override
  void initState() {
    super.initState();
    _initializeMergedListenable();
  }

  @override
  void didUpdateWidget(covariant MergeValueListenables oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.listeners != oldWidget.listeners) {
      _initializeMergedListenable();
    }
  }

  void _initializeMergedListenable() {
    if (widget.listeners.isEmpty) {
      throw Exception("No Listenables for merging");
    }

    removeListener();

    mergedListenable = Listenable.merge(widget.listeners);

    mergedListenable?.addListener(listener);
  }

  @override
  void dispose() {
    removeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  void listener() {
    setState(() {});
  }

  void removeListener() {
    mergedListenable?.removeListener(listener);
  }
}
