import 'package:news_app/core/mediators/either.dart';
import 'package:news_app/core/the_erorrs/failure.dart';
import 'package:news_app/features/domain/entities/G....search_by_source.dart';
import 'package:news_app/features/domain/repositories/search_repository.dart';
import 'package:news_app/features/domain/usecases/usecases.dart';

class SearchByTopHeadlinesAndSources extends Usecase<
    Future<Either<SearchBySource, Failure>>,
    SearchByTopHeadlinesAndSourcesparams> {
  final SearchRepository searchRepository;

  SearchByTopHeadlinesAndSources(
    this.searchRepository,
  );

  // ignore: annotate_overrides
  Future<Either<SearchBySource, Failure>> call(
      SearchByTopHeadlinesAndSourcesparams
          // ignore: avoid_renaming_method_parameters
          searchByTopHeadlinesAndSourcesparams) {
    return searchRepository.searchByTopHeadlinesAndSources(
        category: searchByTopHeadlinesAndSourcesparams.category,
        language: searchByTopHeadlinesAndSourcesparams.language,
        country: searchByTopHeadlinesAndSourcesparams.country);
  }
}

class SearchByTopHeadlinesAndSourcesparams {
  final String? category;
  final String? language;
  final String? country;
  SearchByTopHeadlinesAndSourcesparams({
    this.category,
    this.language,
    this.country,
  });
}
