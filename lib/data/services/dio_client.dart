import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
        )
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        );
}
