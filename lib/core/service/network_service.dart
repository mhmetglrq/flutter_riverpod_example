import 'package:dio/dio.dart';
import 'package:flutter_riverpod_example/core/constants/api_constants.dart';

class NetworkService {
  final Dio dio;

  NetworkService({required this.dio});

  Future<Type?> getRequest(
    String url,
    Map<String, dynamic> queryParameters,
  ) async {
    Type? type;
    try {
      Response response = await dio.request(
        url,
        queryParameters: queryParameters,
        options: Options(
          method: "GET",
          headers: ApiConstants.headers,
          sendTimeout: const Duration(
            milliseconds: 3000,
          ),
        ),
      );
    } catch (e) {
      
    }
    return type;
  }
}
