final _myNotifier = 0.obs;
final myList = [].obs;
Future<void> main(List<String> args) async {
  reaction(() {
    print(_myNotifier.value);
  });

  for (int i = 0; i < 100; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    _myNotifier.value = i;
  }
}

class _MergingListenable implements Listenable {
  List<Listenable> children;
  _MergingListenable(this.children);

  @override
  void addListener(VoidCallback listener) {
    for (int i = 0; i < children.length; i++) {
      children[i].addListener(listener);
    }
  }

  @override
  void removeListener(VoidCallback listener) {
    for (int i = 0; i < children.length; i++) {
      children[i].removeListener(listener);
    }
  }
}

abstract class Listenable {
  void addListener(VoidCallback listener);
  void removeListener(VoidCallback listener);

  static Listenable merge(List<Listenable> listenables) {
    return _MergingListenable(listenables);
  }
}

class ChangeNotifier implements Listenable {
  final List<VoidCallback> _listeners = [];

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void notifyListeners() {
    for (int i = 0; i < _listeners.length; i++) {
      _listeners[i].call();
    }
  }
}

typedef VoidCallback = void Function();

abstract class ValueListenable<T> {
  T get value;
}

class ValueNotifier<T> extends ChangeNotifier implements ValueListenable<T> {
  ValueNotifier(this._value);
  T _value;

  @override
  T get value => _value;

  set value(T newValue) {
    if (newValue == _value) return;
    _value = newValue;
    notifyListeners();
  }
}

class _MyOwnSmContext {
  static final _singleton = _MyOwnSmContext();

  final List<Listenable> _listenables = [];
  var isTracking = false;
  void reportListener(Listenable listenable) {
    if (isTracking) {
      _listenables.add(listenable);
    }
  }

  void track() {
    isTracking = true;
    _listenables.clear();
  }

  Listenable unTrack() {
    isTracking = false;
    return Listenable.merge(_listenables);
  }
}

final _myOwnSmContext = _MyOwnSmContext();

class MyOwnSm<T> extends ValueNotifier<T> {
  MyOwnSm(super.value);

  @override
  T get value {
    print(this);
    _MyOwnSmContext._singleton.reportListener(this);
    return super.value;
  }
}

VoidCallback reaction(VoidCallback scope) {
  _myOwnSmContext.track();
  scope.call();
  Listenable listenable = _myOwnSmContext.unTrack();
  listenable.addListener(scope);
  return () => listenable.removeListener(scope);
}

extension IntExtension on int {
  MyOwnSm<int> get obs {
    return MyOwnSm(this);
  }
}

extension ListExtension<T> on List<T> {
  MyOwnSm<List<T>> get obs {
    return MyOwnSm(this);
  }
}
