import 'package:dio/dio.dart';
import 'package:flutter_application_2/data/services/dio_client.dart';

class JsonplaceholderService {
  final Dio _dio = DioClient.dio;

  Future<List<dynamic>> getPosts() async {
    final response = await _dio.get<dynamic>(
      'https://jsonplaceholder.typicode.com/posts',
    );
    return response.data as List<dynamic>;
  }
}
