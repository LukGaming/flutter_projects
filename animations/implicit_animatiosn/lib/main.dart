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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(
      height: 20,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implict animations"),
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainerExample(),
              gap,
              AnimatedAlignTest(),
              gap,
              AnimatedPaddingWidget(),
              gap,
              AnimatedPositionedWidget()
            ],
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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      color: Colors.greenAccent,
      child: Stack(children: [
        AnimatedPositioned(
          right: 0,
          top: 0,
          bottom: 0,
          left: 0,
          duration: const Duration(seconds: 1),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Alterar posicionamento"),
          ),
        ),
      ]),
    );
  }
}

class AnimatedPaddingWidget extends StatefulWidget {
  const AnimatedPaddingWidget({super.key});

  @override
  State<AnimatedPaddingWidget> createState() => _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> {
  late EdgeInsets padding;
  final smallPadding = const EdgeInsets.all(5);
  final bigPadding = const EdgeInsets.all(15);

  @override
  void initState() {
    padding = smallPadding;
    super.initState();
  }

  void togglePadding() {
    if (padding == smallPadding) {
      padding = bigPadding;
    } else {
      padding = smallPadding;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: AnimatedPadding(
        duration: const Duration(seconds: 1),
        padding: padding,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.indigo,
          child: Center(
              child: ElevatedButton(
            child: const Text("Padding"),
            onPressed: () {
              togglePadding();
            },
          )),
        ),
      ),
    );
  }
}

class AnimatedAlignTest extends StatefulWidget {
  const AnimatedAlignTest({super.key});

  @override
  State<AnimatedAlignTest> createState() => _AnimatedAlignTestState();
}

class _AnimatedAlignTestState extends State<AnimatedAlignTest> {
  late AlignmentDirectional aligment;
  var bottomAlignment = AlignmentDirectional.bottomStart;

  final topAlignment = AlignmentDirectional.topEnd;
  @override
  void initState() {
    super.initState();
    aligment = bottomAlignment;
  }

  void toggleAlignment() {
    if (aligment == bottomAlignment) {
      aligment = topAlignment;
    } else {
      aligment = bottomAlignment;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 200,
      width: 200,
      child: AnimatedAlign(
        alignment: aligment,
        duration: const Duration(milliseconds: 200),
        child: ElevatedButton(
          onPressed: () {
            toggleAlignment();
          },
          child: const Text("Toggle alignment"),
        ),
      ),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({
    super.key,
  });

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  ContainerBase containerSize = SmallContainer();

  void toggleContainerSize() {
    if (containerSize is SmallContainer) {
      containerSize = BigContainer();
    } else {
      containerSize = SmallContainer();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.red,
      width: containerSize.size.width,
      height: containerSize.size.height,
      duration: const Duration(milliseconds: 500),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Animated  Container",
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {
                toggleContainerSize();
              },
              child: const Text(
                "Toggle Container Size",
              ),
            )
          ],
        ),
      ),
    );
  }
}

abstract class ContainerBase {
  final Size size;
  ContainerBase(this.size);
}

class BigContainer extends ContainerBase {
  BigContainer() : super(const Size(500, 600));
}

class SmallContainer extends ContainerBase {
  SmallContainer() : super(const Size(200, 300));
}
