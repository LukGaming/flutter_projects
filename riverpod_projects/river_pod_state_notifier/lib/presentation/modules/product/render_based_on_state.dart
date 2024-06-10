import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:river_pod_test/base/state/base_state.dart';
import 'package:river_pod_test/presentation/controllers/product_controller.dart';
import 'package:river_pod_test/presentation/modules/product/pages/produts_page.dart';

Widget renderBaseOnState(BaseState state) {
  if (state is LoadingState) {
    return const Center(child: CircularProgressIndicator());
  }
  if (state is ProductsLoaded) {
    return ProductList(products: state.products);
  }
  if (state is ErrorState) {
    return Consumer(builder: (context, ref, child) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 50,
            ),
            const Text("Ocorreu um erro ao buscar informações"),
            Text("Erro: ${state.e}"),
            ElevatedButton(
              onPressed: () {
                ref.read(productProvider.notifier).getProducts();
              },
              child: const Text("Tentar novamente"),
            )
          ],
        ),
      );
    });
  }

  return const Text("Algum erro");
}
