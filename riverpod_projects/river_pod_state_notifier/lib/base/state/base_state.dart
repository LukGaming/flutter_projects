abstract class BaseState {}

class LoadingState extends BaseState {}

class SuccessState extends BaseState {}

class ErrorState extends BaseState {
  final Exception e;
  ErrorState(this.e);
}
