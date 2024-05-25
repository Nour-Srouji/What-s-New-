import 'package:news_app/core/mediators/either.dart';
import 'package:news_app/core/the_erorrs/failure.dart';
import 'package:news_app/features/domain/entities/D....search.dart';
import 'package:news_app/features/domain/repositories/search_repository.dart';
import 'package:news_app/features/domain/usecases/usecases.dart';

class SearchByTopHeadlines extends Usecase<Future<Either<Search, Failure>>,
    SearchByTopHeadlinesParams> {
  final SearchRepository searchRepository;
  SearchByTopHeadlines(
    this.searchRepository,
  );
  @override
  Future<Either<Search, Failure>> call(
      // ignore: avoid_renaming_method_parameters
      SearchByTopHeadlinesParams searchByTopHeadlinesParams) {
    return searchRepository.searchByTopHeadlines(
        country: searchByTopHeadlinesParams.country,
        category: searchByTopHeadlinesParams.category,
        q: searchByTopHeadlinesParams.q,
        pageSize: searchByTopHeadlinesParams.pageSize);
  }
}

class SearchByTopHeadlinesParams {
  final String? country;
  final String? category;
  final String? q;
  final int? pageSize;
  SearchByTopHeadlinesParams({
    this.country,
    this.category,
    this.q,
    this.pageSize,
  });
}
