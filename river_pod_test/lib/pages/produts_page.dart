import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_test/base/state/base_state.dart';
import 'package:river_pod_test/controllers/product_cart_controller.dart';
import 'package:river_pod_test/controllers/product_controller.dart';

import 'package:river_pod_test/models/product.dart';
import 'package:river_pod_test/base/product_list_responsivity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    final state = ref.watch(productProvider);

    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(
        key: Key("ProductsKey"),
        child: Column(),
      ),
      appBar: AppBar(
        title: const Text("Product List "),
        actions: [
          GestureDetector(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Badge(
                label: Text(ref.watch(productCartNotifier).length.toString()),
                child: const Icon(Icons.shopping_cart_rounded),
              ),
            ),
          )
        ],
      ),
      body: renderBaseOnState(state),
    );
  }

  Widget renderBaseOnState(BaseState state) {
    if (state is LoadingState) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state is ProductsLoaded) {
      return ProductList(products: state.products);
    }
    if (state is ErrorState) {
      return const Text("Erro!");
    }
    return const Text("Algum erro");
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
    final cartNotifier = ref.watch(productCartNotifier);

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
            Text(
              product.name,
              maxLines: 3,
              style: const TextStyle(fontSize: 20),
            ),
            Text(product.description),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(productCartNotifier.notifier)
                    .addProductToCard(product);
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: !isProductInCart
                      ? const Text("Adicionar ao Carrinho")
                      : const Text("Remover do carrinho"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
