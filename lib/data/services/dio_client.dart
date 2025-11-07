import 'package:dio/dio.dart';

class DioClient {
  static final Dio dio =
      Dio(
          BaseOptions(
            connectTimeout: Duration(seconds: 10),
            receiveTimeout: Duration(seconds: 10),
            headers: {
              'Accept': 'application/json',
              'x-api-key': 'reqres-free-v1',
            },
          ),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onResponse: (response, handler) => handler.next(response),
            onRequest: (options, handler) => handler.next(options),
            onError: (error, handler) => handler.next(error),
          ),
        );
}
