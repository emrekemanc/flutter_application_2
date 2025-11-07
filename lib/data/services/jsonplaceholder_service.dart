import 'package:flutter_application_2/data/services/dio_client.dart';

class JsonplaceholderService {
  final _dio = DioClient.dio;

  Future<List<dynamic>> getPosts() async {
    final response = await _dio.get(
      'https://jsonplaceholder.typicode.com/posts',
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getUset(int id) async {
    final response = await _dio.get(
      'https://jsonplaceholder.typicode.com/users/$id',
    );
    return response.data;
  }
}
