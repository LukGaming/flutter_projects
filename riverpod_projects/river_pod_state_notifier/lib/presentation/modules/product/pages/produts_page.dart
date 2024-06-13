import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_test/presentation/controllers/product_cart_controller.dart';
import 'package:river_pod_test/presentation/controllers/product_controller.dart';

import 'package:river_pod_test/models/product.dart';
import 'package:river_pod_test/base/product_list_responsivity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:river_pod_test/presentation/modules/cart/cart_drawer.dart';
import 'package:river_pod_test/presentation/modules/product/pages/products_app_bar.dart';
import 'package:river_pod_test/presentation/modules/product/render_based_on_state.dart';

class ProductsPage extends ConsumerStatefulWidget {
  const ProductsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ProductsPageState();
  }
}

class _ProductsPageState extends ConsumerState<ProductsPage> {
  @override
  void initState() {
    super.initState();
    ref.read(productProvider.notifier).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const CartDrawer(),
      appBar: AppBar(
        title: const Text("Product List "),
        actions: [
          AppBarProducts(
            scaffoldKey: scaffoldKey,
          ),
        ],
      ),
      body: const ProductConsumerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(productProvider.notifier).generateStateError();
        },
        child: const Icon(Icons.error),
      ),
    );
  }
}

class ProductConsumerWidget extends ConsumerStatefulWidget {
  const ProductConsumerWidget({super.key});

  @override
  ConsumerState<ProductConsumerWidget> createState() =>
      _ProductConsumerWidgetState();
}

class _ProductConsumerWidgetState extends ConsumerState<ProductConsumerWidget> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final state = ref.watch(productProvider);
    return renderBaseOnState(state);
  }
}

class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final ScreenSize screenSize =
        getScreenSize(MediaQuery.of(context).size.width);
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              getSliverDelegatesCrossQuantityFromScreenSize(screenSize)),
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, index) => ProductWidget(product: products[index]),
    );
  }
}

class ProductWidget extends ConsumerWidget {
  final Product product;
  const ProductWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.watch(cartNotifierProvider);

    bool isProductInCart = cartNotifier.contains(product);

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 5,
        ),
        color: const Color.fromARGB(179, 240, 183, 183),
      ),
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  child: Center(
                    child: Text("Image Not Found"),
                  ),
                ),
                loadingBuilder: (context, child, prog) {
                  if (prog?.cumulativeBytesLoaded == 0) {
                    const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return child;
                },
              ),
            ),
            Text(product.name, maxLines: 1),
            Text(product.description, maxLines: 1),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(cartNotifierProvider.notifier)
                    .addProductToCard(product, ref);
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      !isProductInCart
                          ? "Adicionar ao Carrinho"
                          : "Remover do carrinho",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
