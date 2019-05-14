// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _LaunchRestClient extends LaunchRestClient {
  _LaunchRestClient([Dio dio]) {
    _dio = dio;
    if (_dio == null) {
      _dio = Dio();
    }
    final baseUrl = 'https://launchlibrary.net/1.4/launch';
    if (baseUrl != null && baseUrl.isNotEmpty) {
      _dio.options.baseUrl = baseUrl;
    }
  }

  Dio _dio;

  Future<Response<Map<String, dynamic>>> next({int next = 5}) async {
    final queryParameters = <String, dynamic>{'next': next};
    final data = <String, dynamic>{};
    return _dio.request<Map<String, dynamic>>('/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET', headers: {'Accept': 'application/json'}),
        data: data);
  }
}
