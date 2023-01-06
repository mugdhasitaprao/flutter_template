import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/response/joke_details_response_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_service.g.dart';

@RestApi()
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String? baseUrl}) {
    return _RetrofitService(dio, baseUrl: dio.options.baseUrl);
  }

  @GET("/Any?safe-mode")
  Future<HttpResponse<JokeDetailsResponseEntity>> fetchNewJoke();
}
