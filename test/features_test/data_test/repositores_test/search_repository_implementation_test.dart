import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/core/mediators/either.dart';
import 'package:news_app/core/the_erorrs/failure.dart';
import 'package:news_app/features/data/data_sources/global_data_sources/global_search_operations_implementation.dart';
import 'package:news_app/features/data/data_sources/local_data_sources/local_search_opertions_immplementataion.dart';
import 'package:news_app/features/data/repositories/search_repository_implementation.dart';
import 'package:news_app/features/domain/entities/D....search.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("SearchRepositoresImplementation test", () {
    SharedPreferences.setMockInitialValues({});
    test("SearchRepositoresImplementation test with no intenet connection",
        () async {
      GlobalSearchImplementation globalSearch = GlobalSearchImplementation();
      LocalSearchImplementation localSeach = LocalSearchImplementation();

      SearchRepositoryImplementation searchRepo =
          SearchRepositoryImplementation(
              globalSearchOperations: globalSearch,
              localSearchOperation: localSeach);

      Either<Search, Failure> data =
          await searchRepo.searchByEverything(q: "cars", pageSize: 3);

      expect(
          data.second != null &&
              data.second!.message == "No Internet Connection ! ",
          true);
    });

    //********************************************************************************************

    test("SearchRepositoresImplementation test with data", () async {
      GlobalSearchImplementation globalSearch = GlobalSearchImplementation();
      LocalSearchImplementation localSeach = LocalSearchImplementation();

      SearchRepositoryImplementation searchRepo =
          SearchRepositoryImplementation(
              globalSearchOperations: globalSearch,
              localSearchOperation: localSeach);

      Either<Search, Failure> data =
          await searchRepo.searchByEverything(q: "cars", pageSize: 3);

      expect(data.first != null, true);
    });

    //***********************************************************************************************

    test(
        "SearchRepositoresImplementation test without possiblity to process the data",
        () async {
      GlobalSearchImplementation globalSearch = GlobalSearchImplementation();
      LocalSearchImplementation localSeach = LocalSearchImplementation();

      SearchRepositoryImplementation searchRepo =
          SearchRepositoryImplementation(
              globalSearchOperations: globalSearch,
              localSearchOperation: localSeach);

      Either<Search, Failure> data =
          await searchRepo.searchByEverything(q: "apple", pageSize: 3);

      expect(
          data.second != null &&
              data.second!.message == "Failed the process data!",
          true);
    });

    //************عرف انو سيكاند مو نل بس ما طبع نو داتا*********************************

    test("SearchRepositoresImplementation with ErrorModel", () async {
      GlobalSearchImplementation globalSearch = GlobalSearchImplementation();
      LocalSearchImplementation localSeach = LocalSearchImplementation();

      SearchRepositoryImplementation searchRepo =
          SearchRepositoryImplementation(
              globalSearchOperations: globalSearch,
              localSearchOperation: localSeach);

      Either<Search, Failure> data = await searchRepo.searchByEverything(
          q: "q", pageSize: 3, sources: "ددد", sortBy: "jjjj");

      print(data.second!.message);
      expect(data.second != null && data.second!.message == "No data found !",
          true);
    });
    //***********************************************************************************************

    test("SearchRepositoresImplementation test with server", () async {
      GlobalSearchImplementation globalSearch = GlobalSearchImplementation();
      LocalSearchImplementation localSeach = LocalSearchImplementation();

      SearchRepositoryImplementation searchRepo =
          SearchRepositoryImplementation(
              globalSearchOperations: globalSearch,
              localSearchOperation: localSeach);

      Either<Search, Failure> data =
          await searchRepo.searchByEverything(q: "apple", pageSize: 3);

      expect(
          data.second != null &&
              data.second!.message == "Failed connection to the server ! ",
          true);
    });
  });
}
