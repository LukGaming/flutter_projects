import 'package:flutter/material.dart';
import 'package:real_time_editing_controller_validation/new_editing_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FormController(),
    );
  }
}

class FormController extends StatefulWidget {
  const FormController({super.key});

  @override
  State<FormController> createState() => _FormControllerState();
}

class _FormControllerState extends State<FormController> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FindFormByContext(),
          ],
        ),
      ),
    );
  }
}

class FindFormByContext extends StatefulWidget {
  const FindFormByContext({super.key});

  @override
  State<FindFormByContext> createState() => _FindFormByContextState();
}

class _FindFormByContextState extends State<FindFormByContext> {
  final MyState myState = MyState();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: MyForm(
        myState: myState,
        child: Column(
          children: [
            NewEditingController(
              controller: nameController,
              validator: (value) {
                if (value == "") {
                  return "Por favor, preencha o campo.";
                }
                if (value.length < 5) {
                  return "O nome não pode conter menos de 5 caracteres";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            NewEditingController(
              controller: passwordController,
              validator: (value) {
                if (value == "") {
                  return "Por favor, preencha o campo.";
                }
                if (value.length < 5) {
                  return "O nome não pode conter menos de 5 caracteres";
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                myState.validate();
              },
              child: const Text("Validate"),
            )
          ],
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  final MyState myState;
  final Widget child;
  const MyForm({
    super.key,
    required this.myState,
    required this.child,
  });

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    return FormScope(
      myState: widget.myState,
      child: widget.child,
    );
  }
}

class FormScope extends InheritedWidget {
  final MyState myState;
  const FormScope({
    super.key,
    required this.myState,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    print("maybe this is changing");
    return true;
  }
}

class MyState extends ChangeNotifier {
  List<TextEditingController> _controllers = [];
  void update() {
    notifyListeners();
  }

  void validate() {
    notifyListeners();
  }

  void addController(TextEditingController controller) {
    _controllers.add(controller);
  }

  void removeController(TextEditingController controller) {
    _controllers.remove(controller);
  }
}
