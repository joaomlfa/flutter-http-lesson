import 'package:http_poc/model/product/product_model.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> getProducts();
}
