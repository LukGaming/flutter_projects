// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter_core/core/models/base_state.dart';

abstract class BaseStateController extends ChangeNotifier {
  BaseStateController(this.state);

  BaseState state;

  void update() {
    notifyListeners();
  }

  void setIsLoading() {
    state = LoadingState();
    update();
  }

  void setSuccessState(BaseState successState) {
    state = successState;
    update();
  }

  void setErrorState(ErrorState error) {
    state = error;
    update();
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
