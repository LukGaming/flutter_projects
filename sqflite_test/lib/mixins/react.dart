import 'package:flutter/material.dart';

mixin React<T extends StatefulWidget> on State<T> {
  List<Listenable> _listenables = [];

  void react(Listenable listenable) {
    if (!_listenables.contains(listenable)) {
      listenable.addListener(_callback);
      _listenables.add(listenable);
    }
  }

  void _callback() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    for (int i = 0; i < _listenables.length; i++) {
      _listenables[i].removeListener(_callback);
    }
    _listenables = [];
  }
}
