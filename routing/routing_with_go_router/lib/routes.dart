import 'package:go_router/go_router.dart';
import 'package:routing_with_go_router/main.dart';
import 'package:routing_with_go_router/my_first_page_withot_parameter.dart';
import 'package:routing_with_go_router/next_home_page.dart';
import 'package:routing_with_go_router/page_with_parameter.dart';
import 'package:routing_with_go_router/product.dart';

class Routes {
  static String home = "/";
  static String pageWithParameter = '/page_without_parameter';
  static String pageWithNoParameter = '/route_with_params';
  static String routeToPushAndRemove = "/remove-until";
}

final routes = GoRouter(routes: [
  GoRoute(
    name: Routes.home,
    path: Routes.home,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
      path: Routes.pageWithParameter,
      builder: (context, state) {
        print("state.pathParameters ${state.pathParameters}");
        return PageWithParameter(
          product: state as Product,
        );
      }),
  GoRoute(
    name: Routes.pageWithNoParameter,
    path: Routes.pageWithNoParameter,
    builder: (context, state) => const PageWithoutParameter(),
  ),
  GoRoute(
    name: Routes.routeToPushAndRemove,
    path: Routes.routeToPushAndRemove,
    builder: (context, state) => const NextHomePage(),
  ),
]);
