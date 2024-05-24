import 'package:lukapp/domain/entities/models/logged_user.dart';
import 'package:lukapp/modules/base/base_state.dart';

class UnloggedState extends BaseState {}

class LoggedState extends BaseState {
  final LoggedUser loggedUser;

  LoggedState({required this.loggedUser});
}
