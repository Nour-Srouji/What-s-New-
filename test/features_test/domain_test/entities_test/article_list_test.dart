import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/domain/entities/B....article.dart';
import 'package:news_app/features/domain/entities/C....article_list.dart';
import 'package:news_app/features/domain/entities/A....source.dart';

void main() {
  test("test for article_list", () {
    ArticleList art1 = ArticleList(
      articles: [
        Article(
            source: Source(id: "hh", name: "gg"),
            author: "author",
            title: "title",
            description: "description",
            url: "url",
            urlToImage: "urlToImage",
            publishedAt: "publishedAt",
            content: "contant")
      ],
    );

    ArticleList art2 = ArticleList(articles: [
      Article(
          source: Source(id: "hh", name: "gg"),
          author: "author",
          title: "title",
          description: "description",
          url: "url",
          urlToImage: "urlToImage",
          publishedAt: "publishedAt",
          content: "contant")
    ]);
    expect(art1 == art2, true);
  });
}
