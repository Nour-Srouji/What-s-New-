import 'dart:convert';
import 'package:news_app/features/data/data_sources/local_data_sources/local_search_opertions.dart';
import 'package:news_app/features/data/models/search_model.dart';
import 'package:news_app/features/data/models/search_by_source_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSearchImplementation implements LocalSearchOperation {
  ///////////////////  restore  جلب البيانات محليا/////////////////////

  @override
  Future<SearchModel?> searchByEverythingLocally(
      {required String q,
      String? sources,
      String? from,
      String? to,
      String? language,
      String? sortBy,
      int? pageSize}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(
        "every , $q, $sources, $from, $to, $language, $sortBy, $pageSize");
    if (data == null) {
      return null;
    } else {
      dynamic jsondata = jsonDecode(data);
      return SearchModel.fromJson(jsondata);
    }
  }

  @override
  Future<SearchModel?> searchByTopHeadlinesLocally(
      {String? country, String? category, String? q, int? pageSize}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString("top , $country, $category, $q , $pageSize");
    if (data == null) {
      return null;
    } else {
      dynamic jsondata = jsonDecode(data);
      return SearchModel.fromJson(jsondata);
    }
  }

  @override
  Future<SearchBySourceModel?> searchByTopHeadlinesAndSourcesLocally(
      {String? category, String? language, String? country}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data =
        prefs.getString("topSources , $category , $language , $country");
    if (data == null) {
      return null;
    } else {
      dynamic jsondata = jsonDecode(data);
      return SearchBySourceModel.fromJson(jsondata);
    }
  }

  ///////////////////  Store  /////////////////////

  @override
  Future<void> storeSearchByEverythingLocally(
      {required SearchModel model,
      required String q,
      String? sources,
      String? from,
      String? to,
      String? language,
      String? sortBy,
      int? pageSize}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = jsonEncode(model.toJson());
    prefs.setString(
        "every , $q, $sources, $from, $to, $language, $sortBy, $pageSize",
        data);
  }

  @override
  Future<void> storeSearchByTopHeadlinesLocally(
      {required SearchModel model,
      String? country,
      String? category,
      String? q,
      int? pageSize}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = jsonEncode(model.toJson());
    prefs.setString("top , $country, $category, $q , $pageSize", data);
  }

  @override
  Future<void> storesearchByTopHeadlinesAndSourcesLocally(
      {required SearchBySourceModel model,
      String? category,
      String? language,
      String? country}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = jsonEncode(model.toJson());
    prefs.setString("topSources , $category , $language , $country", data);
  }
}
