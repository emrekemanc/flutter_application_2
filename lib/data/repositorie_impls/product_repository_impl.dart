import 'package:flutter_application_2/data/services/fakestore_service.dart';
import 'package:flutter_application_2/domain/entities/product_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final FakestoreService _service = FakestoreService();

  @override
  Future<List<ProductEntitiy>> getAllProducts() async {
    final data = await _service.getAllProducts();
    return data
        .map<ProductEntitiy>(
          (json) => ProductEntitiy.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<ProductEntitiy> getProductById(int id) async {
    final data = await _service.getProductById(id);
    return ProductEntitiy.fromJson(data);
  }

  @override
  Future<List<ProductEntitiy>> getProductsByCategory(String category) async {
    final data = await _service.getProductsByCategory(category);
    return data
        .map<ProductEntitiy>(
          (json) => ProductEntitiy.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }
}
