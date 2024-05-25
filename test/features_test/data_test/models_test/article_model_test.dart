import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/data/models/article_model.dart';
import 'package:news_app/features/data/models/source_model.dart';

void main() {
  group("testing article model", () {
    test("test convirsion from json to articleModel class", () {
      ArticleModel articleModel1 = ArticleModel(
          source: SourceModel(id: null, name: "YouTube"),
          author: null,
          title:
              "Extorsionadores de comerciantes caen en Ate| Código 7 - TVPerú Noticias",
          description:
              " CÓDIGO 7 | Roberto Wong nos presenta las noticias sobre seguridad ciudadana y los operativos policiales en el marco del COVID-19.Sitio Web ►https://www.tv...",
          url: "https://www.youtube.com/watch?v=pf-zvrL4x58",
          urlToImage: "https://i.ytimg.com/vi/pf-zvrL4x58/maxresdefault.jpg",
          publishedAt: "2022-07-25T16:32:59Z",
          content: null);

      Map<String, dynamic> json = {
        "source": {"id": null, "name": "YouTube"},
        "author": null,
        "title":
            "Extorsionadores de comerciantes caen en Ate| Código 7 - TVPerú Noticias",
        "description":
            " CÓDIGO 7 | Roberto Wong nos presenta las noticias sobre seguridad ciudadana y los operativos policiales en el marco del COVID-19.Sitio Web ►https://www.tv...",
        "url": "https://www.youtube.com/watch?v=pf-zvrL4x58",
        "urlToImage": "https://i.ytimg.com/vi/pf-zvrL4x58/maxresdefault.jpg",
        "publishedAt": "2022-07-25T16:32:59Z",
        "content": null
      };
      ArticleModel articleModel2 = ArticleModel.fromJson(json);

      expect(articleModel1 == articleModel2, true);
    });

    //////////////////////////////////////////////////////////////

    test("test convirsion from model to json ", () {
      Map<String, dynamic> json1 = {
        "source": {"id": null, "name": "YouTube"},
        "author": null,
        "title":
            "Extorsionadores de comerciantes caen en Ate| Código 7 - TVPerú Noticias",
        "description":
            " CÓDIGO 7 | Roberto Wong nos presenta las noticias sobre seguridad ciudadana y los operativos policiales en el marco del COVID-19.Sitio Web ►https://www.tv...",
        "url": "https://www.youtube.com/watch?v=pf-zvrL4x58",
        "urlToImage": "https://i.ytimg.com/vi/pf-zvrL4x58/maxresdefault.jpg",
        "publishedAt": "2022-07-25T16:32:59Z",
        "content": null
      };
      ArticleModel articleModel = ArticleModel.fromJson(json1);

      Map<String, dynamic> json2 = articleModel.toJson();

      expect(const DeepCollectionEquality().equals(json1, json2), true);
    });
  });
}
