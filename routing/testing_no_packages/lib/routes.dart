import 'package:testing_no_packages/main.dart';
import 'package:testing_no_packages/my_first_page_withot_parameter.dart';
import 'package:testing_no_packages/page_with_parameter.dart';

class Routes {
  static String home = "/";
  static String pageWithParameter = '/page_without_parameter';
  static String pageWithNoParameter = '/route_with_params';
}

final routes = {
  Routes.home: (context) => const HomePage(),
  Routes.pageWithParameter: (context) => const PageWithoutParameter(),
  Routes.pageWithNoParameter: (context) => const PageWithParameter(),
};
