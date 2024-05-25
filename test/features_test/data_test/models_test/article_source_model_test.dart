import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/data/models/article_source_model.dart';
import 'package:collection/collection.dart';

void main() {
  group("testing articleSource Model", () {
    test("test convirsion from json to ArticleSourceModel class", () {
      ArticleSourceModel articleSourceModel1 = ArticleSourceModel(
          id: "abc-news",
          name: "ABC News",
          description: "Your, and videos at ABCNews.com.",
          url: "https://abcnews.go.com",
          category: "general",
          language: "en",
          country: "us");

      Map<String, String> json = {
        "id": "abc-news",
        "name": "ABC News",
        "description": "Your, and videos at ABCNews.com.",
        "url": "https://abcnews.go.com",
        "category": "general",
        "language": "en",
        "country": "us"
      };
      ArticleSourceModel articleSourceModel2 =
          ArticleSourceModel.fromJson(json);
      expect(articleSourceModel1 == articleSourceModel2, true);
    });
    //////////////////////////////////////////
    test("test convirsion from model to json ", () {
      Map<String, String> json1 = {
        "id": "abc-news",
        "name": "ABC News",
        "description": "Your, and videos at ABCNews.com.",
        "url": "https://abcnews.go.com",
        "category": "general",
        "language": "en",
        "country": "us"
      };
      ArticleSourceModel articleSourceModel =
          ArticleSourceModel.fromJson(json1);

      Map<String, String> json2 = articleSourceModel.toJson();

      expect(const DeepCollectionEquality().equals(json1, json2), true);
    });
  });
}
