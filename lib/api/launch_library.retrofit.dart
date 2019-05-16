// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_library.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _LaunchLibrary extends LaunchLibrary {
  _LaunchLibrary([Dio dio]) {
    _dio = dio;
    if (_dio == null) {
      _dio = Dio();
    }
    final baseUrl = 'https://launchlibrary.net/1.4';
    if (baseUrl != null && baseUrl.isNotEmpty) {
      _dio.options.baseUrl = baseUrl;
    }
  }

  Dio _dio;

  Future<Response<Map<String, dynamic>>> launch(
      {int next = null, String mode = "verbose"}) async {
    final queryParameters = <String, dynamic>{'next': next, 'mode': mode};
    final data = <String, dynamic>{};
    return _dio.request<Map<String, dynamic>>('/launch',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET', headers: {'Accept': 'application/json'}),
        data: data);
  }
}