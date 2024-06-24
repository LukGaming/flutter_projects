// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

abstract class BaseController<T> extends ChangeNotifier {
  BaseController(this.state);
  T state;

  void update() {
    notifyListeners();
  }
}
