import 'package:flutter_application_2/domain/entities/product_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/product_repository.dart';

class GetProductById {
  GetProductById(this.repository);
  final ProductRepository repository;

  Future<ProductEntitiy> call(int id) async => repository.getProductById(id);
}
