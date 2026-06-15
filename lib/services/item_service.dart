import 'package:dio/dio.dart';
import '../model/item_model.dart';

class ItemService {
  static const String _baseUrl = 'https://api.piontech.site';
  static const String _regionCode = 'US';
  static const String _categoryId = 'dc9c9b2d-845b-4315-8c30-9f9e87b24ee6';

  late final Dio _dio;

  ItemService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add logging interceptor for debugging
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: false,
        responseBody: false,
        logPrint: (obj) => print('[DIO] $obj'),
      ),
    );
  }

  Future<ItemResponse> getItems() async {
    try {
      final response = await _dio.get(
        '/stores/api/v5.0/public/items/get-all',
        queryParameters: {
          'region_code': _regionCode,
          'category_id': _categoryId,
        },
      );

      if (response.statusCode == 200) {
        return ItemResponse.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Unexpected status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Kết nối quá thời gian. Vui lòng thử lại.');
      case DioExceptionType.badResponse:
        return Exception(
            'Lỗi server: ${error.response?.statusCode}. Vui lòng thử lại.');
      case DioExceptionType.connectionError:
        return Exception(
            'Không có kết nối mạng. Vui lòng kiểm tra lại.');
      default:
        return Exception('Đã xảy ra lỗi: ${error.message}');
    }
  }
}
