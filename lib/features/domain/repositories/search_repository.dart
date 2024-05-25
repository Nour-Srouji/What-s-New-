import 'package:news_app/core/mediators/either.dart';
import 'package:news_app/core/the_erorrs/failure.dart';
import 'package:news_app/features/domain/entities/D....search.dart';
import 'package:news_app/features/domain/entities/G....search_by_source.dart';

abstract class SearchRepository {
  Future<Either<Search, Failure>> searchByEverything(
      {required String q,
      String? sources,
      String? from,
      String? to,
      String? language,
      String? sortBy,
      int? pageSize});

  Future<Either<Search, Failure>> searchByTopHeadlines(
      {String? country, String? category, String? q, int? pageSize});

  Future<Either<SearchBySource, Failure>> searchByTopHeadlinesAndSources({
    String? category,
    String? language,
    String? country,
  });
}
