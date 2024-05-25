import 'package:news_app/core/mediators/either.dart';
import 'package:news_app/features/data/models/error_model.dart';
import 'package:news_app/features/data/models/search_by_source_model.dart';
import 'package:news_app/features/data/models/search_model.dart';

abstract class GlobalSearchOperations {
  Future<Either<SearchModel, ErrorArticleModel>> searchByEverythingGlobally(
      {required String q,
      String? sources,
      String? from,
      String? to,
      String? language,
      String? sortBy,
      int? pageSize});

  Future<Either<SearchModel, ErrorArticleModel>> searchByTopHeadlinesGlobally(
      {String? country, String? category, String? q, int? pageSize});

  Future<Either<SearchBySourceModel, ErrorArticleModel>>
      searchByTopHeadlinesAndSourcesGlobally({
    String? category,
    String? language,
    String? country,
  });
}
