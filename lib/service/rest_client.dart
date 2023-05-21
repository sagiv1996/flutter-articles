import 'package:articles/db/db.dart';
import 'package:articles/db/tables/article_table.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/response_articles.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://newsapi.org/v2/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("top-headlines?country=us")
  Future<ResponseArticles> getArticles(@Query("apikey") String apiKey,
      @Query('page') int page, @Query('pageSize') int pageSize);
}
