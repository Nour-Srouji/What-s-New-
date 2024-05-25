import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/data/models/article_source_list_model.dart';
import 'package:news_app/features/data/models/article_source_model.dart';
import 'package:news_app/features/data/models/search_by_source_model.dart';
import 'package:collection/collection.dart';

void main() {
  group("testing for search by source model", () {
    test("test convirsion from json to SearchBySourceModel class", () {
      SearchBySourceModel searchBySourceModel1 = SearchBySourceModel(
          status: "ok",
          sources: ArticleSoureListModel(articleSorceListM: [
            ArticleSourceModel(
                id: "abc-news",
                name: "ABC News",
                description: "Your, and videos at ABCNews.com.",
                url: "https://abcnews.go.com",
                category: "general",
                language: "en",
                country: "us")
          ]));

      Map<String, dynamic> json = {
        "status": "ok",
        "sources": [
          {
            "id": "abc-news",
            "name": "ABC News",
            "description": "Your, and videos at ABCNews.com.",
            "url": "https://abcnews.go.com",
            "category": "general",
            "language": "en",
            "country": "us"
          }
        ]
      };
      SearchBySourceModel searchBySourceModel2 =
          SearchBySourceModel.fromJson(json);

      expect(searchBySourceModel2 == searchBySourceModel1, true);
    });
    //////////////////////////////////////////////

    test("test convirsion from SearchBySourceModel. to json ", () {
      Map<String, dynamic> json1 = {
        "status": "ok",
        "sources": [
          {
            "id": "abc-news",
            "name": "ABC News",
            "description": "Your, and videos at ABCNews.com.",
            "url": "https://abcnews.go.com",
            "category": "general",
            "language": "en",
            "country": "us"
          }
        ]
      };
      SearchBySourceModel searchBySourceModel =
          SearchBySourceModel.fromJson(json1);
      Map<String, dynamic> json2 = searchBySourceModel.toJson();
      expect(const DeepCollectionEquality().equals(json1, json2), true);
    });
  });
}
