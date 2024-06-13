import 'package:my_own_sm/models/product.dart';
import 'package:my_own_sm/models/types/typedefs.dart';

class ProductsRepository {
  Future<ProductsList> getProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Product(
        id: 1,
        name: "Produto 1",
      ),
      Product(
        id: 2,
        name: "Produto 2",
      ),
    ];
  }
}
