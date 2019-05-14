import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'launch_rest_client.retrofit.dart';

@RestApi(baseUrl: "https://launchlibrary.net/1.4/launch")
abstract class LaunchRestClient {
  static LaunchRestClient instance([Dio dio]) => _LaunchRestClient(dio);

  @GET("/")
  @Headers({
    "Accept": "application/json"
  })
  Future<Response<Map<String, dynamic>>> next({@Query("next") int next = 5});

}