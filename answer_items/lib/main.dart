import 'package:answer_items/answer_items/iso_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) => const Answer(),
          itemCount: 20,
        ),
      ),
    );
  }
}

const defaultAnswerPadding = EdgeInsets.all(10);
const defaultHeightGap = SizedBox(height: 5);
const defaultBorderRadius = BorderRadius.all(Radius.circular(10));
const iconGap = SizedBox(width: 5);

ValueNotifier<bool> showPossibleAnswers = ValueNotifier(false);

class Answer extends StatefulWidget {
  const Answer({super.key});

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool _showAnswersItems = true;
  List<String> _answersItems = [
    "Resposta 1",
    "Resposta 2",
    "Reposta 3",
  ];

  List<Widget> _answerWidgets = [];

  void showAnswersCallback() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    _answerWidgets = _answersItems
        .map(
          (e) => const Column(
            children: [
              defaultHeightGap,
              AnswerButton(),
            ],
          ),
        )
        .toList();
    showPossibleAnswers.addListener(showAnswersCallback);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      padding: defaultAnswerPadding,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 207, 206, 206),
        borderRadius: defaultBorderRadius,
      ),
      child: Column(
        children: [
          const IsoName(),
          const AnswerTitle(),
          defaultHeightGap,
          const AnswerButton(),
          Column(children: showPossibleAnswers.value ? _answerWidgets : [])
        ],
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultAnswerPadding,
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: defaultBorderRadius,
      ),
      width: double.infinity,
      child: GestureDetector(
        onTap: () {},
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Resposta Selecionada",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerTitle extends StatelessWidget {
  const AnswerTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "4 - Contexto da organização",
          style: TextStyle(fontSize: 18),
        ),
        Row(
          children: [
            const Text(
              "*",
              style: TextStyle(color: Colors.red),
            ),
            iconGap,
            InkWell(
              child: const Icon(Icons.keyboard_arrow_down),
              onTap: () =>
                  showPossibleAnswers.value = !showPossibleAnswers.value,
            ),
            iconGap,
            const Icon(Icons.add),
          ],
        )
      ],
    );
  }
}
