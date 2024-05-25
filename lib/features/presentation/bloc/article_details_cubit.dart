import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/mediators/either.dart';
import 'package:news_app/core/the_erorrs/failure.dart';
import 'package:news_app/features/data/data_sources/global_data_sources/global_search_operations.dart';
import 'package:news_app/features/data/data_sources/global_data_sources/global_search_operations_implementation.dart';
import 'package:news_app/features/data/data_sources/local_data_sources/local_search_opertions.dart';
import 'package:news_app/features/data/data_sources/local_data_sources/local_search_opertions_immplementataion.dart';
import 'package:news_app/features/data/models/article_model.dart';
import 'package:news_app/features/data/repositories/search_repository_implementation.dart';
import 'package:news_app/features/domain/entities/B....article.dart';
import 'package:news_app/features/domain/repositories/search_repository.dart';
import 'package:news_app/features/domain/usecases/search_by_everything.dart';
import 'package:news_app/features/domain/usecases/usecases.dart';
import 'package:news_app/features/presentation/bloc/article_state.dart';

class ArticleDetailsCubit extends Cubit<ArticleState> {
  ArticleDetailsCubit() : super(InitialArticleState());

  Future<void> getShowDetailsData(
      SearchByEverythingParams searchByEverythingParams) async {
    emit(LoadingArticleState());
    LocalSearchOperation lso = LocalSearchImplementation();
    GlobalSearchOperations gso = GlobalSearchImplementation();
    SearchRepository repository = SearchRepositoryImplementation(
        localSearchOperation: lso, globalSearchOperations: gso);
    Usecase searchByEveryThing = SearchByEverything(repository);
    Either<Article, Failure> data =
        await searchByEveryThing.call(searchByEverythingParams);
    if (data.first != null) {
      emit(DataArticleState((data.first! as ArticleModel)));
    } else {
      emit(ErrorArticleState(data.second!.message));
    }
  }
}
