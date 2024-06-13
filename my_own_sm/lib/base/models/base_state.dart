abstract class BaseState {}

class InitialState extends BaseState {}

class LoadingState extends BaseState {}

class SuccessState<T extends dynamic> extends BaseState {
  final T data;
  SuccessState({required this.data});
}
