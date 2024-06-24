import 'package:flutter_core/core/abstract/abstract_base_state_controller.dart';
import 'package:flutter_core/core/abstract/abstract_controller.dart';
import 'package:flutter_test/flutter_test.dart';

class _CounterController extends BaseController<int> {
  //iniciamos com um valor inicial no super
  _CounterController() : super(0);

  //exemplo de método
  void increment() {
    state++;
    update(); // notifica os escutadores
  }

  void decrement() {
    state--;
    update();
  }
}

void main() {
  // Ensure Flutter bindings are initialized
  TestWidgetsFlutterBinding.ensureInitialized();

  group('IController', () {
    late _CounterController userController;

    setUp(() {
      userController = _CounterController();
    });

    test('initial state should be 0', () {
      expect(userController.state, equals(0));
    });

    test('increment should increase state by 1', () {
      userController.increment();
      expect(userController.state, equals(1));
    });

    test('decrement should decrease state by 1', () {
      userController.decrement();
      expect(userController.state, equals(-1));
    });

    test('listeners should be notified on increment', () {
      bool notified = false;
      userController.addListener(() {
        notified = true;
      });

      userController.increment();
      expect(notified, isTrue);
    });

    test('listeners should be notified on decrement', () {
      bool notified = false;
      userController.addListener(() {
        notified = true;
      });

      userController.decrement();
      expect(notified, isTrue);
    });

    test('state can be set directly and notifyListeners should work', () {
      bool notified = false;
      userController.addListener(() {
        notified = true;
      });

      userController.state = 42;
      userController.update();

      expect(userController.state, equals(42));
      expect(notified, isTrue);
    });
  });
}
