import 'package:flutter_application_2/domain/entities/product_entitiy.dart';

abstract class ProductRepository {
  Future<List<ProductEntitiy>> getAllProducts();
  Future<ProductEntitiy> getProductById(int id);
  Future<List<ProductEntitiy>> getProductsByCategory(String category);
}
