import 'package:http_poc/model/product/product_model.dart';
import 'package:http_poc/repositories/product/i_product_repository.dart';

class ProductRepository implements IProductRepository {
  @override
  Future<List<ProductModel>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
