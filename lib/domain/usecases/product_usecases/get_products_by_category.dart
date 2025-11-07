import 'package:flutter_application_2/domain/entities/product_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/product_repository.dart';

class GetProductsByCategory {
  final ProductRepository repository;

  GetProductsByCategory(this.repository);
  Future<List<ProductEntitiy>> call(String category) async =>
      await repository.getProductsByCategory(category);
}
