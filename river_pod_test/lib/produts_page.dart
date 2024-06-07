import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_test/base/state/base_state.dart';
import 'package:river_pod_test/controllers/product_controller.dart';

import 'package:river_pod_test/models/product.dart';
import 'package:river_pod_test/product_list_responsivity.dart';
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
    // TODO: implement initState
    super.initState();
    ref.read(productProvider).getProducts();

  }

  @override
  Widget build(BuildContext context) {


    final productState = ref.watch(productProvider);
    final state = productState.productState;
    print(state);
    if (state is LoadingState) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state is ProductsLoaded) {
      return ProductList(products: state.products);
    }
    if (state is ErrorState) {
      return const Text("Erro!");
    }
    return Text("Algum erro");
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              getSliverDelegatesCrossQuantityFromScreenSize(screenSize)),
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, index) => ProductWidget(product: products[index]),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
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
                errorBuilder: (context, error, stackTrace) => Container(
                  child: const Center(
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
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Center(
                  child: Text("Adicionar ao Carrinho"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
