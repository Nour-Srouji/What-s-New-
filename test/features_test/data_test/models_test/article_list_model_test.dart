import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/data/models/article_list_model.dart';
import 'package:news_app/features/data/models/article_model.dart';
import 'package:news_app/features/data/models/source_model.dart';
import 'package:collection/collection.dart';

void main() {
  group("testing article list model", () {
    test("test convirsion from json to articleListModel class", () {
      ArticleListModel articleListModel1 = ArticleListModel(articleListM: [
        ArticleModel(
            source: SourceModel(id: null, name: "YouTube"),
            author: "author",
            title: "title",
            description: null,
            url: "url",
            urlToImage: "urlToImage",
            publishedAt: "2022-07-28T09:30:00Z",
            content: "content")
      ]);

      List<Map<String, dynamic>> json = [
        {
          "source": {"id": null, "name": "YouTube"},
          "author": "author",
          "title": "title",
          "description": null,
          "url": "url",
          "urlToImage": "urlToImage",
          "publishedAt": "2022-07-28T09:30:00Z",
          "content": "content"
        }
      ];

      ArticleListModel articleListModel2 = ArticleListModel.fromJson(json);

      expect(articleListModel1 == articleListModel2, true);
    });

    ///////////////////////////////////////
    test("test convirsion from model to json class", () {
      List<Map<String, dynamic>> json1 = [
        {
          "source": {"id": null, "name": "YouTube"},
          "author": "author",
          "title": "title",
          "description": null,
          "url": "url",
          "urlToImage": "urlToImage",
          "publishedAt": "2022-07-28T09:30:00Z",
          "content": "content"
        }
      ];
      ArticleListModel articleListModel = ArticleListModel.fromJson(json1);

      List<Map<String, dynamic>> json2 = articleListModel.toJson();
      expect(const DeepCollectionEquality().equals(json1, json2), true);
    });
  });
}
