import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/domain/entities/B....article.dart';
import 'package:news_app/features/domain/entities/C....article_list.dart';
import 'package:news_app/features/domain/entities/D....search.dart';
import 'package:news_app/features/domain/entities/A....source.dart';

void main() {
  test("test for search", () {
    Search search1 = Search(
        status: "status",
        totalResults: 50,
        article: ArticleList(articles: [
          Article(
              source: Source(id: "hh", name: "gg"),
              author: "author",
              title: "title",
              description: "description",
              url: "url",
              urlToImage: "urlToImage",
              publishedAt: "publishedAt",
              content: "contant")
        ]));

    Search search2 = Search(
        status: "status",
        totalResults: 50,
        article: ArticleList(articles: [
          Article(
              source: Source(id: "hh", name: "gg"),
              author: "author",
              title: "title",
              description: "description",
              url: "url",
              urlToImage: "urlToImage",
              publishedAt: "publishedAt",
              content: "contant")
        ]));

    expect(search1 == search2, true);
  });
}
