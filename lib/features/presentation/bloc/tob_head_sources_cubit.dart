import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/mediators/either.dart';
import 'package:news_app/core/the_erorrs/failure.dart';
import 'package:news_app/features/data/data_sources/global_data_sources/global_search_operations.dart';
import 'package:news_app/features/data/data_sources/global_data_sources/global_search_operations_implementation.dart';
import 'package:news_app/features/data/data_sources/local_data_sources/local_search_opertions.dart';
import 'package:news_app/features/data/data_sources/local_data_sources/local_search_opertions_immplementataion.dart';
import 'package:news_app/features/data/models/search_by_source_model.dart';
import 'package:news_app/features/data/repositories/search_repository_implementation.dart';
import 'package:news_app/features/domain/entities/G....search_by_source.dart';
import 'package:news_app/features/domain/repositories/search_repository.dart';
import 'package:news_app/features/domain/usecases/search_by_top_headlines_and_source.dart';
import 'package:news_app/features/domain/usecases/usecases.dart';

import 'article_state.dart';

class TopAndSourcesCubit extends Cubit<ArticleState> {
  TopAndSourcesCubit() : super(InitialArticleState());

  Future<void> getTopHeadlinesSourcesData(
      SearchByTopHeadlinesAndSourcesparams
          searchByTopHeadlinesAndSourcesparams) async {
    emit(LoadingArticleState());
    LocalSearchOperation lso = LocalSearchImplementation();
    GlobalSearchOperations gso = GlobalSearchImplementation();
    SearchRepository repository = SearchRepositoryImplementation(
        globalSearchOperations: gso, localSearchOperation: lso);
    Usecase seachByTopHeadlinesAndSources =
        SearchByTopHeadlinesAndSources(repository);
    Either<SearchBySource, Failure> data = await seachByTopHeadlinesAndSources
        .call(SearchByTopHeadlinesAndSourcesparams);
    if (data.first != null) {
      emit(DataArticleState(data.first!.sources as SearchBySourceModel));
    } else {
      emit(ErrorArticleState(data.second!.message));
    }
  }
}
