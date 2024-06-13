abstract class BaseState {}

class LoadingState extends BaseState {}

class SuccessState<T extends dynamic> extends BaseState {
  T data;
  SuccessState({
    required this.data,
  });
}

class ErrorState extends BaseState {
  Exception error;
  ErrorState({
    required this.error,
  });
}
