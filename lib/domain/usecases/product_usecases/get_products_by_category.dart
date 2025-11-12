import 'package:flutter_application_2/domain/entities/product_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/product_repository.dart';

class GetProductsByCategory {
  GetProductsByCategory(this.repository);
  final ProductRepository repository;
  Future<List<ProductEntitiy>> call(String category) async =>
      repository.getProductsByCategory(category);
}
