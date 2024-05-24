import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lukapp/domain/entities/models/logged_user.dart';
import 'package:lukapp/domain/entities/request/create_user_request.dart';
import 'package:lukapp/modules/auth/states/auth_state.dart';
import 'package:lukapp/modules/base/base_state.dart';
import 'package:lukapp/modules/second_step/second_tep_screen.dart';

class AuthController extends ChangeNotifier {
  BaseState _state;

  BaseState get state => _state;

  AuthController() : _state = LoadingState();

  void createNewUser({
    required CreateUserRequest user,
    required BuildContext context,
  }) {
    _state = LoggedState(
      loggedUser: LoggedUser(
        id: 1,
        name: "Paulo",
        email: "thelukgaming333@gmail.com",
      ),
    );

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => SecondStepScreen(),
      ),
      (route) => false,
    );
  }
}
