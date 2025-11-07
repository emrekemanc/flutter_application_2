import 'package:flutter_application_2/domain/entities/product_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/product_repository.dart';

class GetProductById {
  final ProductRepository repository;
  final int id;
  GetProductById(this.repository, this.id);

  Future<ProductEntitiy> call() async => await repository.getProductById(id);
}
