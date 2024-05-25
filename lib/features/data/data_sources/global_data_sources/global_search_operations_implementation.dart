import 'package:dio/dio.dart';
import 'package:news_app/core/mediators/either.dart';
import 'package:news_app/core/services/client.dart';
import 'package:news_app/features/data/data_sources/constant/text.dart';
import 'package:news_app/features/data/data_sources/global_data_sources/global_search_operations.dart';
import 'package:news_app/features/data/models/error_model.dart';
import 'package:news_app/features/data/models/search_model.dart';
import 'package:news_app/features/data/models/search_by_source_model.dart';

class GlobalSearchImplementation implements GlobalSearchOperations {
  @override
  Future<Either<SearchModel, ErrorArticleModel>> searchByEverythingGlobally(
      {required String q,
      String? sources,
      String? from,
      String? to,
      String? language,
      String? sortBy,
      int? pageSize}) async {
    Client client = Client.create(Texts.urlBase);
    Response information = await client.get("v2/everything",
        queryParameters: {
          "q": q,
          "sources": sources,
          "from": from,
          "to": to,
          "language": language,
          "sortBy": sortBy,
          "pageSize": pageSize,
          "apiKey": Texts.apiKey
        },
        options: Options(contentType: "applictaion/json"));
    if (information.data["status"] == "ok") {
      return Either(first: SearchModel.fromJson(information.data));
    } else {
      return Either(second: ErrorArticleModel.fromJson(information.data));
    }
  }

  //  *********************************************************************************
  // **********************************************************************************
  @override
  Future<Either<SearchModel, ErrorArticleModel>> searchByTopHeadlinesGlobally(
      {String? country, String? category, String? q, int? pageSize}) async {
    Client client = Client.create(Texts.urlBase);

    Response information = await client.get("v2/top-headlines",
        queryParameters: {
          "country": country,
          "category": category,
          "q": q,
          "pageSize": pageSize,
          "apiKey": Texts.apiKey,
        },
        options: Options(contentType: "applictaion/json"));

    if (information.data["status"] == "ok") {
      return Either(first: SearchModel.fromJson(information.data));
    } else {
      return Either(second: ErrorArticleModel.fromJson(information.data));
    }
  }

  //  *********************************************************************************
  // **********************************************************************************
  @override
  Future<Either<SearchBySourceModel, ErrorArticleModel>>
      searchByTopHeadlinesAndSourcesGlobally(
          {String? category, String? language, String? country}) async {
    Client client = Client.create(Texts.urlBase);
    Response information = await client.get("v2/top-headlines/sources",
        queryParameters: {
          "category": category,
          "language": language,
          "country": country,
          "apiKey": Texts.apiKey
        },
        options: Options(contentType: "applictaion/json"));
    if (information.data["status"] == "ok") {
      return Either(first: SearchBySourceModel.fromJson(information.data));
    } else {
      return Either(second: ErrorArticleModel.fromJson(information.data));
    }
  }
}
