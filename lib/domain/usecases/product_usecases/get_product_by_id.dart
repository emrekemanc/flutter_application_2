import 'package:flutter_application_2/domain/entities/product_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/product_repository.dart';

class GetProductById {
  final ProductRepository repository;

  GetProductById(this.repository);

  Future<ProductEntitiy> call(int id) async =>
      await repository.getProductById(id);
}
