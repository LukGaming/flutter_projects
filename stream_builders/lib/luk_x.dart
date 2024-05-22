import 'dart:async';

import 'package:stream_builders/luk_x_basestate.dart';

class LukX<T extends LukXState<T>> {
  late StreamController<T> _streamController;

  void _create(T initState) {
    _streamController = StreamController<T>.broadcast();
    _addToSink(initState);
  }

  void _addToSink(T initState) {
    initState.state = initState;
    _streamController.sink.add(initState.state);
  }

  set state(T newState) {
    _addToSink(newState);
  }

  get state => _streamController.stream;

  void close() {
    _streamController.close();
  }

  void dispose() {}
}
