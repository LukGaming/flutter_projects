import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_test/presentation/controllers/product_cart_controller.dart';

class AppBarProducts extends ConsumerWidget {
  const AppBarProducts({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        scaffoldKey.currentState?.openDrawer();
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Badge(
          label: Text(ref.watch(cartNotifierProvider).length.toString()),
          child: const Icon(Icons.shopping_cart_rounded),
        ),
      ),
    );
  }
}
