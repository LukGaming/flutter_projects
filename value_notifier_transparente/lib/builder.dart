import 'package:flutter/material.dart';
part 'transparent_value_notifier.dart';

class ListenValue extends StatelessWidget {
  final Widget Function(BuildContext context) builder;
  const ListenValue(this.builder, {super.key, required});

  @override
  StatelessElement createElement() {
    return _ReactBuildElement(this);
  }

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}

class _ReactBuildElement extends StatelessElement {
  _ReactBuildElement(super.widget);
  Listenable? listenable;

  void listener() {
    markNeedsBuild();
  }

  @override
  void unmount() {
    listenable?.removeListener(listener);
    super.unmount();
  }

  @override
  Widget build() {
    _myOwnSmContext.track();
    final child = super.build();
    listenable?.removeListener(listener);
    listenable = _myOwnSmContext.unTrack();

    listenable?.addListener(listener);
    return child;
  }
}
