// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

class LukXState<T extends LukXState<T>> {
  T state;
  LukXState({
    required this.state,
  });
}
