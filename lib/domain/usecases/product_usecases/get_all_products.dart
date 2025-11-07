import 'package:flutter_application_2/domain/entities/product_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/product_repository.dart';

class GetAllProducts {
  final ProductRepository repository;
  GetAllProducts(this.repository);
  Future<List<ProductEntitiy>> call() async =>
      await repository.getAllProducts();
}
