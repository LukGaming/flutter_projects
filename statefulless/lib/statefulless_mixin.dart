import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
mixin StateFullLess on StatelessWidget {
  final List<Listenable> _listenables = [];

  BuildContext? _oldContext;
  void _callback() {
    (_oldContext as Element).markNeedsBuild();
  }

  void notifierReact(
    Listenable listenable,
    BuildContext context,
  ) {
    _oldContext ??= context;

    if (!_listenables.contains(listenable)) {
      _listenables.add(listenable);
      listenable.addListener(_callback);
    }
  }

  void useTextEditingController(
    TextEditingController controller,
    BuildContext context,
  ) {
    _oldContext ??= context;

    controller.addListener(_callback);
    // if (!_listenables.contains(listenable)) {
    //   _listenables.add(listenable);
    //   listenable.addListener(_callback);
    // }
  }

  void dispose() {
    for (int i = 0; i < _listenables.length; i++) {
      _listenables[i].removeListener(_callback);
    }

    FlutterMemoryAllocations.instance
        .dispatchObjectDisposed(object: _listenables);
  }
}
