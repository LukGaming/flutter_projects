import 'package:flutter/material.dart';
import 'package:real_time_editing_controller_validation/src/objects/leading_validation_icons.dart';
import 'package:real_time_editing_controller_validation/src/objects/prefix_validation_icons.dart';
import 'package:real_time_editing_controller_validation/src/objects/suffix_validation_icons.dart';
import 'package:real_time_editing_controller_validation/src/widgets/custom_text_field.dart';

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
  final EditingControllersState myState = EditingControllersState();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _firstController = TextEditingController();
    final _secondController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: _firstController,
              validator: (value) {
                if (value == "") {
                  return "O valor não pode ficar vazio.";
                }
                if (value.length < 5) {
                  return "O valor deve conter pelo menos 5 caracteres";
                }
                return null;
              },
              validationLeadingIcons: ValidationLeadingIcons(
                iddleIcon: const Icon(Icons.person),
                errorIcon: const Icon(Icons.person, color: Colors.red),
                successIcon: const Icon(Icons.person, color: Colors.green),
              ),
              validateOnUserInteraction: true,
              validationPrefixIcons: PrefixValidationIcons(
                iddleIcon: const Icon(Icons.person),
                errorIcon: const Icon(Icons.person, color: Colors.red),
                successIcon: const Icon(Icons.person, color: Colors.green),
              ),
              validationSuffixIcons: SuffixValidationIcons(
                iddleIcon: const Icon(Icons.person),
                errorIcon: const Icon(Icons.person, color: Colors.red),
                successIcon: const Icon(Icons.person, color: Colors.green),
              ),
            ),
            CustomTextField(
              controller: _secondController,
              validator: (value) {
                if (value == "") {
                  return "O valor não pode ficar vazio.";
                }
                if (value.length < 5) {
                  return "O valor deve conter pelo menos 5 caracteres";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              validateOnUserInteraction: true,
              validationLeadingIcons: ValidationLeadingIcons(
                iddleIcon: const Icon(Icons.person),
                errorIcon: const Icon(Icons.person, color: Colors.red),
                successIcon: const Icon(Icons.person, color: Colors.green),
              ),
              validationPrefixIcons: PrefixValidationIcons(
                iddleIcon: const Icon(Icons.person),
                errorIcon: const Icon(Icons.person, color: Colors.red),
                successIcon: const Icon(Icons.person, color: Colors.green),
              ),
              validationSuffixIcons: SuffixValidationIcons(
                iddleIcon: const Icon(Icons.person),
                errorIcon: const Icon(Icons.person, color: Colors.red),
                successIcon: const Icon(Icons.person, color: Colors.green),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                bool? isFormValid = _formKey.currentState?.validate();
              },
              child: const Text("Validate"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  final EditingControllersState myState;
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
  final EditingControllersState myState;
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

class EditingControllersState extends ChangeNotifier {
  final List<TextEditingController> _controllers = [];
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

  bool isFormValid() {
    return true;
  }
}
