import 'dart:ffi';

import 'package:articles/model/articel_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/response_articles.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://newsapi.org/v2/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(
      "everything?q=tesla&from=2023-04-16&sortBy=publishedAt&apiKey=505e647bbabd48d1ba723b85b0f685c6")
  Future<ResponseArticles> getArticles();
}
