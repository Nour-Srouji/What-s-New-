// ignore_for_file: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/core/mediators/either.dart';
import 'package:news_app/features/data/data_sources/global_data_sources/global_search_operations_implementation.dart';
import 'package:news_app/features/data/data_sources/local_data_sources/local_search_opertions_immplementataion.dart';
import 'package:news_app/features/data/models/error_model.dart';
import 'package:news_app/features/data/models/search_by_source_model.dart';
import 'package:news_app/features/data/models/search_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("testing Local", () {
    test('testing Local seach everything', () async {
      SharedPreferences.setMockInitialValues({});
      GlobalSearchImplementation globalOp = GlobalSearchImplementation();
      LocalSearchImplementation localOp = LocalSearchImplementation();
      Either<SearchModel, ErrorArticleModel> result =
          await globalOp.searchByEverythingGlobally(
        q: "sports",
        sources: "bbc-news",
        pageSize: 3,
      );

      if (result.first != null) {
        await localOp.storeSearchByEverythingLocally(
          model: result.first!,
          q: "sports",
          sources: "bbc-news",
          pageSize: 3,
        );

        SearchModel? model = await localOp.searchByEverythingLocally(
          q: "sports",
          sources: "bbc-news",
          pageSize: 3,
        );
        // expect(model != null, true);

        // print(result.first!.toJson());
        expect(model != null && model == result.first, true);
      } else {
        expect(result.second != null, true);
      }
    });

    //****************************************************************************/
    //***************************************************************************/
    test('testing Local seach top_headlines', () async {
      SharedPreferences.setMockInitialValues({});
      GlobalSearchImplementation globalOp = GlobalSearchImplementation();
      LocalSearchImplementation localOp = LocalSearchImplementation();
      Either<SearchModel, ErrorArticleModel> result =
          await globalOp.searchByTopHeadlinesGlobally(
              q: "lg", pageSize: 3, category: "technology", country: "us");

      if (result.first != null) {
        await localOp.storeSearchByTopHeadlinesLocally(
            model: result.first!,
            q: "lg",
            pageSize: 3,
            category: "technology",
            country: "us");

        SearchModel? model = await localOp.searchByTopHeadlinesLocally(
            q: "lg", pageSize: 3, category: "technology", country: "us");

        expect(model != null && model == result.first, true);
      } else {
        expect(result.second != null, true);
      }
    });
    //************************************************************************* */
    //************************************************************************* */
    test('testing Local seach topheadlinesAndsources', () async {
      SharedPreferences.setMockInitialValues({});
      GlobalSearchImplementation globalOp = GlobalSearchImplementation();
      LocalSearchImplementation localOp = LocalSearchImplementation();
      Either<SearchBySourceModel, ErrorArticleModel> result =
          await globalOp.searchByTopHeadlinesAndSourcesGlobally(
              category: "health", language: "en", country: "us");

      if (result.first != null) {
        await localOp.storesearchByTopHeadlinesAndSourcesLocally(
          model: result.first!,
          category: "health",
          language: "en",
          country: "us",
        );

        SearchBySourceModel? model =
            await localOp.searchByTopHeadlinesAndSourcesLocally(
                category: "health", language: "en", country: "us");

        expect(model != null && model == result.first, true);
      } else {
        expect(result.second != null, true);
      }
    });
  });
}
