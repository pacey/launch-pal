import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'launch_library.retrofit.dart';

@RestApi(baseUrl: "https://launchlibrary.net/1.4")
abstract class LaunchLibrary {
  static LaunchLibrary instance([Dio dio]) => _LaunchLibrary(dio);

  @GET("/launch")
  @Headers({
    "Accept": "application/json"
  })
  Future<Response<Map<String, dynamic>>> launch({@Query("next") int next, @Query("mode") String mode = "verbose"});

}