import 'package:flutter/material.dart';
import 'package:real_time_editing_controller_validation/src/controllers/real_time_form_controller.dart';
import 'package:real_time_editing_controller_validation/src/classes/leading_validation_icons.dart';
import 'package:real_time_editing_controller_validation/src/classes/prefix_validation_icons.dart';
import 'package:real_time_editing_controller_validation/src/classes/suffix_validation_icons.dart';
import 'package:real_time_editing_controller_validation/src/widgets/custom_text_field.dart';
import 'package:real_time_editing_controller_validation/src/widgets/real_time_validation_form.dart';

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
  final RTFormController myState = RTFormController();

  @override
  Widget build(BuildContext context) {
    final firstController = TextEditingController();
    final secondController = TextEditingController();
    final formController = RTFormController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RTFormValidator(
        rtFormController: formController,
        child: Column(
          children: [
            RTTextField(
              controller: firstController,
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
            RTTextField(
              controller: secondController,
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
                bool isFormValid = formController.isFormValid();

                print("IsformValid: $isFormValid");
              },
              child: const Text("Validate"),
            ),
          ],
        ),
      ),
    );
  }
}
