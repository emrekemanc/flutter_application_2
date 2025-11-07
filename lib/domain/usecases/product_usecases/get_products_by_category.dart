import 'package:flutter_application_2/domain/entities/product_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/product_repository.dart';

class GetProductsByCategory {
  final ProductRepository repository;
  final String category;
  GetProductsByCategory(this.category, this.repository);
  Future<List<ProductEntitiy>> call() async =>
      await repository.getProductsByCategory(category);
}
