import 'package:dio/dio.dart';
import 'package:flutter_application_2/data/services/dio_client.dart';

class FakestoreService {
  final Dio _dio = DioClient.dio;

  Future<List<dynamic>> getAllProducts() async {
    final response = await _dio.get<dynamic>(
      'https://fakestoreapi.com/products',
    );
    return response.data as List<dynamic>;
  }

  Future<Map<String, dynamic>> getProductById(int id) async {
    final response = await _dio.get<dynamic>(
      'https://fakestoreapi.com/products/$id',
    );
    return response.data as Map<String, dynamic>;
  }

  Future<List<dynamic>> getProductsByCategory(String category) async {
    final response = await _dio.get<dynamic>(
      'https://fakestoreapi.com/products/category/$category',
    );
    return response.data as List<dynamic>;
  }
}
