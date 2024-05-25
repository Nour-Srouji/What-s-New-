import 'package:news_app/core/mediators/either.dart';
import 'package:news_app/core/the_erorrs/failure.dart';
import 'package:news_app/features/domain/entities/D....search.dart';
import 'package:news_app/features/domain/repositories/search_repository.dart';
import 'package:news_app/features/domain/usecases/usecases.dart';

class SearchByEverything
    extends Usecase<Future<Either<Search, Failure>>, SearchByEverythingParams> {
  final SearchRepository searchRepository;

  SearchByEverything(this.searchRepository);
  @override
  Future<Either<Search, Failure>> call(
      // ignore: avoid_renaming_method_parameters
      SearchByEverythingParams searchByEverythingParams) {
    return searchRepository.searchByEverything(
        q: searchByEverythingParams.q,
        sources: searchByEverythingParams.sources,
        from: searchByEverythingParams.from,
        to: searchByEverythingParams.to,
        language: searchByEverythingParams.language,
        sortBy: searchByEverythingParams.sortBy,
        pageSize: searchByEverythingParams.pageSize);
  }
}

class SearchByEverythingParams {
  final String q;
  final String? sources;
  final String? from;
  final String? to;
  final String? language;
  final String? sortBy;
  final int? pageSize;
  SearchByEverythingParams({
    required this.q,
    this.sources,
    this.from,
    this.to,
    this.language,
    this.sortBy,
    this.pageSize,
  });
}
