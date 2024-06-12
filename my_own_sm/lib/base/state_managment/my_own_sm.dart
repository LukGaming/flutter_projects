abstract class MyOwnSm {
  List<CallbackListener> _listeners = [];

  void addListener(CallbackListener listener) {
    _listeners.add(listener);
  }

  void removeListener(CallbackListener listener) {
    print("Removendo Listener");
    _listeners.remove(listener);
    print(_listeners);
  }

  void update() {
    for (int i = 0; i < _listeners.length; i++) {
      _listeners[i].call();
    }
  }
}

typedef CallbackListener = Function;
