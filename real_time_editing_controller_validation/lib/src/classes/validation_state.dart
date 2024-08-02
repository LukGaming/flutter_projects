// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ValidationState {}

class IddleValidation extends ValidationState {}

class ErrorValidation extends ValidationState {
  String errorMessage;
  ErrorValidation(this.errorMessage);
}

class SuccessValidation extends ValidationState {}
