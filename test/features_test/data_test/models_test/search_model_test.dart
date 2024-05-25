import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/data/models/article_list_model.dart';
import 'package:news_app/features/data/models/article_model.dart';
import 'package:news_app/features/data/models/search_model.dart';
import 'package:news_app/features/data/models/source_model.dart';
import 'package:collection/collection.dart';

void main() {
  group("testing for search model", () {
    test('convert from Json to search model class', () {
      SearchModel searchModel1 = SearchModel(
          status: "ok",
          totalResults: 55,
          articles: ArticleListModel(articleListM: [
            ArticleModel(
                source: SourceModel(id: null, name: "YouTube"),
                author: "author",
                title:
                    "Update it to get the best YouTube experience and our latest features",
                description: "description",
                url: "https://www.youtube.com/supported_browsers?nexwagXWPRfI",
                urlToImage: "urlToImage",
                publishedAt: "2022-07-28T09:30:00Z",
                content: "content")
          ]));

      Map<String, dynamic> json = {
        "status": "ok",
        "totalResults": 55,
        "articles": [
          {
            "source": {"id": null, "name": "YouTube"},
            "author": "author",
            "title":
                "Update it to get the best YouTube experience and our latest features",
            "description": "description",
            "url": "https://www.youtube.com/supported_browsers?nexwagXWPRfI",
            "urlToImage": "urlToImage",
            "publishedAt": "2022-07-28T09:30:00Z",
            "content": "content"
          },
        ]
      };
      SearchModel searchModel2 = SearchModel.fromJson(json);

      expect(searchModel1 == searchModel2, true);
    });
    //////////////////////////////////////////

    test("convert.. from model to json", () {
      Map<String, dynamic> json1 = {
        "status": "ok",
        "totalResults": 55,
        "articles": [
          {
            "source": {"id": null, "name": "YouTube"},
            "author": "author",
            "title":
                "Update it to get the best YouTube experience and our latest features",
            "description": "description",
            "url": "https://www.youtube.com/supported_browsers?nexwagXWPRfI",
            "urlToImage": "urlToImage",
            "publishedAt": "2022-07-28T09:30:00Z",
            "content": "content"
          },
        ]
      };

      SearchModel searchModel = SearchModel.fromJson(json1);

      Map<String, dynamic> json2 = searchModel.toJson();
      expect(const DeepCollectionEquality().equals(json1, json2), true);
    });
  });
}
