// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class BaseState {}

class InitialState extends BaseState {}

class LoadingState extends BaseState {}

class SuccessState<T> extends BaseState {
  T data;
  SuccessState(this.data);
}

class ErrorState extends BaseState {
  String message;
  ErrorState(this.message);
}
