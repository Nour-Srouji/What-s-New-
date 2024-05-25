import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:news_app/features/data/models/article_source_list_model.dart';
import 'package:news_app/features/data/models/article_source_model.dart';

void main() {
  group("testing article source list model ", () {
    test("test convirsion from json to articleSourceListModel class", () {
      ArticleSoureListModel articleSoureListModel1 =
          ArticleSoureListModel(articleSorceListM: [
        ArticleSourceModel(
            id: "abc-news",
            name: "ABC News",
            description:
                "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
            url: "https://abcnews.go.com",
            category: "general",
            language: "en",
            country: "us")
      ]);
      List<Map<String, String>> json = [
        {
          "id": "abc-news",
          "name": "ABC News",
          "description":
              "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
          "url": "https://abcnews.go.com",
          "category": "general",
          "language": "en",
          "country": "us"
        }
      ];
      ArticleSoureListModel articleSoureListModel2 =
          ArticleSoureListModel.fromJson(json);

      expect(articleSoureListModel1 == articleSoureListModel2, true);
    });
    ////////////////////////////////////////////////////////////////////

    test("test convirsion from articleSourceListModel to json", () {
      List<Map<String, String>> json1 = [
        {
          "id": "abc-news",
          "name": "ABC News",
          "description":
              "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
          "url": "https://abcnews.go.com",
          "category": "general",
          "language": "en",
          "country": "us"
        }
      ];
      ArticleSoureListModel articleSoureListModel =
          ArticleSoureListModel.fromJson(json1);

      List<dynamic> json2 = articleSoureListModel.toJson();

      expect(const DeepCollectionEquality().equals(json1, json2), true);
    });
  });
}
