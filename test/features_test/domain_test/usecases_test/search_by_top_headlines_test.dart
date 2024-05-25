import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/core/mediators/either.dart';
import 'package:news_app/core/the_erorrs/failure.dart';
import 'package:news_app/features/domain/entities/D....search.dart';
import 'package:news_app/features/domain/entities/G....search_by_source.dart';
import 'package:news_app/features/domain/repositories/search_repository.dart';
import 'package:news_app/features/domain/usecases/search_by_top_headlines_and_source.dart';

class FakeInterfaceImplementation implements SearchRepository {
  @override
  Future<Either<Search, Failure>> searchByEverything(
      {required String q,
      String? sources,
      String? from,
      String? to,
      String? language,
      String? sortBy,
      int? pageSize}) {
    return Future.value(Either(second: Failure("")));
  }

  @override
  Future<Either<Search, Failure>> searchByTopHeadlines(
      {String? country,
      String? category,
      String? sources,
      String? q,
      int? pageSize}) {
    return Future.value(Either(second: Failure("")));
  }

  @override
  Future<Either<SearchBySource, Failure>> searchByTopHeadlinesAndSources(
      {String? category, String? language, String? country}) {
    return Future.value(Either(second: Failure("TopHeadlinesAndSources")));
  }
}

void main() {
  test('Test SearchByTopHeadlinesAndSources usecase', () async {
    SearchByTopHeadlinesAndSources searchByTopHeadlinesAndSources =
        SearchByTopHeadlinesAndSources(FakeInterfaceImplementation());
    SearchByTopHeadlinesAndSourcesparams searchByTopHeadlinesAndSourcesParams =
        SearchByTopHeadlinesAndSourcesparams();
    String message = (await searchByTopHeadlinesAndSources
            .call(searchByTopHeadlinesAndSourcesParams))
        .second!
        .message;
    expect(message == "TopHeadlinesAndSources", true);
  });
}
