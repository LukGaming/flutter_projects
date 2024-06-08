// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class BaseState {}

class LoadingState extends BaseState {}

class SuccessState<T extends dynamic> extends BaseState {
  T state;
  SuccessState({
    required this.state,
  });
}

class ErrorState extends BaseState {
  final Exception error;
  ErrorState({
    required this.error,
  });
}
