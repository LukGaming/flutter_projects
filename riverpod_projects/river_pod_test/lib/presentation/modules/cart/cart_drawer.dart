import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_test/controllers/product_cart_controller.dart';

class CartDrawer extends StatelessWidget {
  const CartDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: const Key("ProductsKey"),
      child: Consumer(
        builder: (_, ref, __) {
          final cartProducts = ref.watch(cartNotifierProvider);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                cartProducts.isEmpty
                    ? "Nenhum Produto no carrinho"
                    : "Produtos no carrinho",
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: cartProducts
                    .map(
                      (product) => Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(179, 240, 183, 183),
                            border: Border.all(color: Colors.blue, width: 2)),
                        child: ListTile(
                          title: Text(product.name),
                          trailing: IconButton(
                            onPressed: () {
                              ref
                                  .read(cartNotifierProvider.notifier)
                                  .addProductToCard(product, ref);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          );
        },
      ),
    );
  }
}
