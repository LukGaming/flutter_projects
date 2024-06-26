// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_core/core/abstract/abstract_base_state_controller.dart';
import 'package:flutter_core/core/abstract/abstract_controller.dart';
import 'package:flutter_core/core/models/base_state.dart';
import 'package:flutter_test/flutter_test.dart';

class _User {
  int id;
  String name;
  _User({
    required this.id,
    required this.name,
  });
}

class _UserController extends BaseStateController {
  _UserController() : super(InitialState());

  Future<void> checkUserLogged() async {
    state = LoadingState();
    update();
    await Future.delayed(const Duration(seconds: 1));
    state = ErrorState("User not logged");
    update();
  }

  Future<void> logUser() async {
    state = LoadingState();
    update();
    await Future.delayed(const Duration(seconds: 1));
    state = SuccessState(_User(id: 11, name: "Paulo"));
    update();
  }

  Future<void> logout() async {
    state = LoadingState();
    update();
    await Future.delayed(const Duration(seconds: 1));
    state = SuccessState(_User(id: 11, name: "Paulo"));
    update();
  }
}

final _userController = _UserController();

class LoggedUserWidget extends StatefulWidget {
  const LoggedUserWidget({super.key});

  @override
  State<LoggedUserWidget> createState() => _LoggedUserWidgetState();
}

class _LoggedUserWidgetState extends State<LoggedUserWidget> {
  @override
  void initState() {
    _userController.checkUserLogged();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: _userController,
        builder: (context, child) {
          final state = _userController.state;
          switch (state) {
            case LoadingState():
              return const Center(child: CircularProgressIndicator());
            case ErrorState():
              return Center(
                child: ElevatedButton(
                    onPressed: () {
                      _userController.logUser();
                    },
                    child: const Text("Usuário não logado")),
              );
            case SuccessState<_User>():
              return Center(
                child: Column(
                  children: [
                    const Text("Usuário logado."),
                    Text("id: ${state.data.id}}"),
                    Text("nome: ${state.data.name}}")
                  ],
                ),
              );

            default:
              return const Center(
                  child: Text("Controlador ainda não inicializado"));
          }
        },
      ),
    );
  }
}

void main() {
  group('_UserController', () {
    late _UserController controller;

    setUp(() {
      controller = _UserController();
    });

    test('initial state is InitialState', () {
      expect(controller.state, isA<InitialState>());
    });

    test('checkUserLogged sets state to ErrorState', () async {
      await controller.checkUserLogged();
      expect(controller.state, isA<ErrorState>());
      expect((controller.state as ErrorState).message, "User not logged");
    });

    test('logUser sets state to SuccessState with _User', () async {
      await controller.logUser();
      expect(controller.state, isA<SuccessState<_User>>());
      expect((controller.state as SuccessState<_User>).data.id, 11);
      expect((controller.state as SuccessState<_User>).data.name, "Paulo");
    });

    test('logout sets state to SuccessState with _User', () async {
      await controller.logout();
      expect(controller.state, isA<SuccessState<_User>>());
      expect((controller.state as SuccessState<_User>).data.id, 11);
      expect((controller.state as SuccessState<_User>).data.name, "Paulo");
    });
  });
}
