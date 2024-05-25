import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/core/mediators/either.dart';
import 'package:news_app/features/data/data_sources/global_data_sources/global_search_operations.dart';
import 'package:news_app/features/data/data_sources/local_data_sources/local_search_opertions.dart';
import 'package:news_app/features/data/models/error_model.dart';
import 'package:news_app/features/data/models/search_by_source_model.dart';
import 'package:news_app/features/data/models/search_model.dart';
import 'package:news_app/features/domain/entities/G....search_by_source.dart';
import 'package:news_app/features/domain/entities/D....search.dart';
import 'package:news_app/core/the_erorrs/failure.dart';
import 'package:news_app/features/domain/repositories/search_repository.dart';

//  الاخطاء الممكنة اثناء طلب البيانات من الانترنت
class SearchRepositoryImplementation implements SearchRepository {
  final GlobalSearchOperations globalSearchOperations;
  final LocalSearchOperation localSearchOperation;

  SearchRepositoryImplementation(
      {required this.globalSearchOperations,
      required this.localSearchOperation});

  @override
  Future<Either<Search, Failure>> searchByEverything(
      {required String q,
      String? sources,
      String? from,
      String? to,
      String? language,
      String? sortBy,
      int? pageSize}) async {
    try {
      Either<SearchModel, ErrorArticleModel> data =
          await globalSearchOperations.searchByEverythingGlobally(
              q: q,
              pageSize: pageSize,
              sources: sources,
              sortBy: sortBy,
              from: from,
              to: to,
              language: language);
      if (data.first != null) {
        localSearchOperation.storeSearchByEverythingLocally(
            model: data.first!,
            q: q,
            pageSize: pageSize,
            sources: sources,
            sortBy: sortBy,
            from: from,
            to: to,
            language: language);
        return Either(first: data.first!);
      } else {
        return Either(
            second: Failure("No data found !")); // ErrorModle (no result)
      } //end if
    } on DioError catch (e) {
      print(e.message);
      if (e.error is SocketException) {
        SearchModel? model =
            await localSearchOperation.searchByEverythingLocally(
                q: q,
                sources: sources,
                from: from,
                to: to,
                language: language,
                sortBy: sortBy,
                pageSize: pageSize);
        if (model == null) {
          return Either(second: Failure("No Internet Connection ! "));
        } else {
          return Either(first: model);
        }

        ///end if
      } else {
        return Either(second: Failure("Failed connection to the server ! "));
      } ////end if
    } catch (e) {
      return Either(second: Failure("Failed the process data!"));
    }
  }

//******************************************************************************
//******************************************************************************
  @override
  Future<Either<Search, Failure>> searchByTopHeadlines(
      {String? country, String? category, String? q, int? pageSize}) async {
    try {
      Either<SearchModel, ErrorArticleModel> data =
          await globalSearchOperations.searchByTopHeadlinesGlobally(
              country: country, category: category, q: q, pageSize: pageSize);
      if (data.first != null) {
        localSearchOperation.storeSearchByTopHeadlinesLocally(
            model: data.first!,
            country: country,
            category: category,
            q: q,
            pageSize: pageSize);
        return Either(first: data.first!);
      } else {
        return Either(second: Failure("No data found !"));
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        SearchModel? model =
            await localSearchOperation.searchByTopHeadlinesLocally(
                country: country, category: category, q: q, pageSize: pageSize);
        if (model == null) {
          return Either(second: Failure("No Internet Connection !"));
        } else {
          return Either(first: model);
        }
      } else {
        return Either(second: Failure("Failed connection to the server !"));
      }
    } catch (e) {
      return Either(second: Failure(" Failed the process data ! "));
    }
  }

//******************************************************************************
//******************************************************************************

  @override
  Future<Either<SearchBySource, Failure>> searchByTopHeadlinesAndSources(
      {String? category, String? language, String? country}) async {
    try {
      Either<SearchBySourceModel, ErrorArticleModel> data =
          await globalSearchOperations.searchByTopHeadlinesAndSourcesGlobally(
              country: country, language: language, category: category);
      if (data.first != null) {
        localSearchOperation.storesearchByTopHeadlinesAndSourcesLocally(
            model: data.first!,
            category: category,
            language: language,
            country: country);

        return Either(first: data.first!);
      } else {
        return Either(second: Failure("No data found !"));
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        SearchBySourceModel? model =
            await localSearchOperation.searchByTopHeadlinesAndSourcesLocally(
          country: country,
          language: language,
          category: category,
        );
        if (model == null) {
          return Either(second: Failure("No Internet Connection !"));
        } else {
          return Either(first: model);
        }
      } else {
        return Either(second: Failure("Failed connection to the server !"));
      }
    } catch (e) {
      return Either(second: Failure(" Failed the process data ! "));
    }
  }
}
