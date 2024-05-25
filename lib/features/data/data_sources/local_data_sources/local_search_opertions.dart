import 'package:news_app/features/data/models/search_by_source_model.dart';
import 'package:news_app/features/data/models/search_model.dart';

abstract class LocalSearchOperation {
  ////////////////////restore ////////////////////////

  Future<SearchModel?> searchByEverythingLocally(
      {required String q,
      String? sources,
      String? from,
      String? to,
      String? language,
      String? sortBy,
      int? pageSize});

  Future<SearchModel?> searchByTopHeadlinesLocally(
      {String? country, String? category, String? q, int? pageSize});

  Future<SearchBySourceModel?> searchByTopHeadlinesAndSourcesLocally({
    String? category,
    String? language,
    String? country,
  });

////////////////////store ////////////////////////

  Future<void> storeSearchByEverythingLocally(
      {required SearchModel model,
      required String q,
      String? sources,
      String? from,
      String? to,
      String? language,
      String? sortBy,
      int? pageSize});

  Future<void> storeSearchByTopHeadlinesLocally(
      {required SearchModel model,
      String? country,
      String? category,
      String? q,
      int? pageSize});

  Future<void> storesearchByTopHeadlinesAndSourcesLocally({
    required SearchBySourceModel model,
    String? category,
    String? language,
    String? country,
  });
}
