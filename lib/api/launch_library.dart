import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'launch_library.retrofit.dart';

@RestApi(baseUrl: "https://launchlibrary.net/1.4")
abstract class LaunchLibrary {
  static LaunchLibrary instance([Dio dio]) => _LaunchLibrary(dio);

  @GET("/launch")
  @Headers({"Accept": "application/json"})
  Future<Response<Map<String, dynamic>>> nextLaunches(
      {@Query("next") int next = 20, @Query("mode") String mode = "verbose"});

  @GET("/launch")
  @Headers({"Accept": "application/json"})
  Future<Response<Map<String, dynamic>>> launch(@Query("id") int id,
      {@Query("mode") String mode = "verbose"});
}
