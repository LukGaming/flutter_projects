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
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _logoAnimation;
  late AnimationController _logoAnimationController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _logoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    // ..addListener(() {
    //   setState(() {});
    // });

    _logoAnimation =
        Tween<double>(begin: 0, end: 1).animate(_logoAnimationController);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _logoAnimationController.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            children: [
              CustomPaint(
                painter: SplashScreenPainter(_animation.value),
                child: Container(),
              ),
              Center(
                child: AnimatedBuilder(
                  animation: _logoAnimation,
                  builder: (context, child) {
                    return AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                      opacity: _logoAnimation.value,
                      child: const Icon(
                        Icons.star, // Substitua pelo ícone desejado
                        size: 100.0,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SplashScreenPainter extends CustomPainter {
  final double progress;

  SplashScreenPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paintRed = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final paintBlue = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // Triângulo vermelho que se expande a partir do canto inferior esquerdo (fora da tela)
    Path redTriangle = Path()
      ..moveTo(-size.width, size.height)
      ..lineTo(size.width * progress, size.height)
      ..lineTo(0, size.height * (1 - progress))
      ..close();

    // Triângulo azul que se expande a partir do canto superior direito (fora da tela)
    Path blueTriangle = Path()
      ..moveTo(size.width, -size.height)
      ..lineTo(size.width, size.height * progress)
      ..lineTo(size.width * (1 - progress), 0)
      ..close();

    canvas.drawPath(redTriangle, paintRed);
    canvas.drawPath(blueTriangle, paintBlue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
