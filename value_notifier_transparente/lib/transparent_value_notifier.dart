part of 'builder.dart';

Future<void> main(List<String> args) async {
  final _myNotifier = ValueNotifier(0);

  reaction(() {
    print(_myNotifier.value);
  });
}

typedef VoidCallback = void Function();

abstract class ValueListenable<T> {
  T get value;
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
    _myOwnSmContext.reportListener(this);
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
