// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

abstract class IController<T> extends ChangeNotifier {
  IController(this.state);
  T state;

  void update() {
    notifyListeners();
  }
}

//exemplo de uso
// class CounterController extends IController<int> {
//   //iniciamos com um valor inicial no super
//   UserController() : super(0);

//   //exemplo de método
//   void increment() {
//     state++;
//     update(); // notifica os escutadores
//   }

//   void decrement() {
//     state--;
//     update();
//   }
// }
