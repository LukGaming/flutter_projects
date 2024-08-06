import 'package:flutter/material.dart';

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
      home: const ImplicitAnimations(),
    );
  }
}

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({super.key});

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  final verticalSeparator = const SizedBox(height: 10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("a"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AnimatedContainerWidget(),
            verticalSeparator,
            const AnimatedOpacityWidget(),
            verticalSeparator,
            const AnimatedAlignWidget(),
            verticalSeparator,
            const AnimatedPaddingWidget(),
            verticalSeparator,
            const AnimatedPositionedWidget(),
            verticalSeparator,
            const AnimatedCrossFadeWidget()
          ],
        ),
      ),
    );
  }
}

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  bool isExpanded = false;
  void toggleExpansion() {
    isExpanded = !isExpanded;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 250,
      ),
      height: isExpanded ? 400 : 200,
      width: isExpanded ? 400 : 200,
      decoration: BoxDecoration(
        color: isExpanded ? Colors.red : Colors.blue,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              toggleExpansion();
            },
            child: Text(isExpanded ? "Me expanda!" : "Me diminuia")),
      ),
    );
  }
}

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({super.key});

  @override
  State<AnimatedOpacityWidget> createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  bool isVisible = true;
  void toggleIsVisible() {
    isVisible = !isVisible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: isVisible ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              toggleIsVisible();
            },
            child: Text(isVisible ? "Sumir..." : "Aparecer..."))
      ],
    );
  }
}

class AnimatedAlignWidget extends StatefulWidget {
  const AnimatedAlignWidget({super.key});

  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  bool isRight = false;

  void toggleAlignment() {
    isRight = !isRight;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey,
      child: AnimatedAlign(
        alignment: isRight ? Alignment.topRight : Alignment.bottomLeft,
        duration: const Duration(milliseconds: 500),
        child: InkWell(
          onTap: () => {toggleAlignment()},
          child: Text(isRight
              ? "Me alinhe para esquerda inferior"
              : "Me alinhe para direita superior..."),
        ),
      ),
    );
  }
}

class AnimatedPaddingWidget extends StatefulWidget {
  const AnimatedPaddingWidget({super.key});

  @override
  State<AnimatedPaddingWidget> createState() => _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> {
  bool isExpanded = true;

  void toggleExpanded() {
    isExpanded = !isExpanded;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 400,
      height: 400,
      child: AnimatedPadding(
        padding:
            isExpanded ? const EdgeInsets.all(50) : const EdgeInsets.all(5),
        duration: const Duration(milliseconds: 500),
        child: Container(
          color: Colors.blue,
          height: 400,
          width: 400,
          child: ElevatedButton(
            onPressed: () {
              toggleExpanded();
            },
            child: Text(
              isExpanded ? "Me diminuia" : "Me expanda",
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedPositionedWidget extends StatefulWidget {
  const AnimatedPositionedWidget({super.key});

  @override
  State<AnimatedPositionedWidget> createState() =>
      _AnimatedPositionedWidgetState();
}

class _AnimatedPositionedWidgetState extends State<AnimatedPositionedWidget> {
  bool isBottomRight = false;

  void togglePosition() {
    isBottomRight = !isBottomRight;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: 400,
      height: 400,
      child: Stack(
        children: [
          AnimatedPositioned(
            left: isBottomRight ? 300 : 0,
            top: isBottomRight ? 300 : 0,
            duration: const Duration(milliseconds: 500),
            child: ElevatedButton(
              onPressed: () {
                togglePosition();
              },
              child: Container(
                color: Colors.red,
                child: Text(
                  isBottomRight
                      ? "Me alinhe a esquerda superior"
                      : "Me leve para baixo a direita",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool showFirstWidget = true;

  void toggleWidget() {
    showFirstWidget = !showFirstWidget;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        toggleWidget();
      },
      child: AnimatedCrossFade(
        duration: const Duration(seconds: 1),
        firstChild: _firstWidget(),
        secondChild: _secdondWidget(),
        crossFadeState: showFirstWidget
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
      ),
    );
  }

  Widget _firstWidget() {
    return const Column(
      children: [
        Icon(Icons.add),
        Text(
          "Primeiro Widget",
        )
      ],
    );
  }

  Widget _secdondWidget() {
    return const Column(
      children: [
        Icon(Icons.account_balance),
        Text("Second Widget"),
      ],
    );
  }
}
