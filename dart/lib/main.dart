import 'package:chuva_dart/pages/home/home_presenter.dart';
import 'package:chuva_dart/shared/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const ChuvaDart());
}

class ChuvaDart extends StatelessWidget {
  const ChuvaDart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chuva',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFF456189),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      home: const InjectionPage(child: HomePresenter()),
    );
  }
}

class InjectionPage extends StatefulWidget {
  final Widget child;
  const InjectionPage({super.key, required this.child});

  @override
  State<InjectionPage> createState() => _InjectionPageState();
}

class _InjectionPageState extends State<InjectionPage> {
  @override
  void initState() {
    super.initState();
    setupDependencies(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: widget.child);
  }
}
