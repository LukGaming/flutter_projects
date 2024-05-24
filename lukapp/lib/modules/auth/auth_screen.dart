import 'package:flutter/material.dart';
import 'package:lukapp/dependencies/injector.dart';
import 'package:lukapp/domain/entities/request/create_user_request.dart';
import 'package:lukapp/modules/auth/controllers/auth_controller.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _authController = Injector().get<AuthController>();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(label: Text("Nome")),
                  controller: _nameController,
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "Por favor preencha o nome.";
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Email")),
                  controller: _emailController,
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "Por favor preencha o Email.";
                    }
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "Por favor preencha a senha.";
                    }
                  },
                  decoration: InputDecoration(
                      label: const Text("Senha"),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _isObscure = !_isObscure;
                            setState(() {});
                          },
                          icon: _isObscure
                              ? const Icon(
                                  Icons.visibility,
                                )
                              : const Icon(Icons.visibility_off))),
                  controller: _passwordController,
                  obscureText: _isObscure,
                ),
                TextButton(
                  onPressed: () {
                    var isFormValid = _formKey.currentState?.validate();
                    if (isFormValid == true) {
                      _authController.createNewUser(
                          user: CreateUserRequest(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                          context: context);
                    }
                  },
                  child: const Text("Criar usuário"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
