import 'package:dio/dio.dart';
import 'package:flutter_application_2/data/services/dio_client.dart';

class ReqresService {
  final Dio _dio = DioClient.dio;

  Future<Map<String, dynamic>> createUser(String name, String job) async {
    final response = await _dio.post(
      'https://reqres.in/api/users',
      data: {'name': name, 'job': job},
    );

    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    final response = await _dio.post(
      'https://reqres.in/api/login',
      data: {'email': email, 'password': password},
    );
    return response.data as Map<String, dynamic>;
  }
}
