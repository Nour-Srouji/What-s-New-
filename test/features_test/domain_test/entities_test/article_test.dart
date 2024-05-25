import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/domain/entities/B....article.dart';
import 'package:news_app/features/domain/entities/A....source.dart';

void main() {
  test("test for articale", () {
    final Article article1 = Article(
        source: Source(id: "id", name: "name"),
        author: "author",
        title: "title",
        description: "description",
        url: "url",
        urlToImage: "urlToImage",
        publishedAt: "publishedAt",
        content: "contant");

    final Article article2 = Article(
        source: Source(id: "id", name: "name"),
        author: "author",
        title: "title",
        description: "description",
        url: "url",
        urlToImage: "urlToImage",
        publishedAt: "publishedAt",
        content: "contant");

    expect(article1 == article2, true);
  });
}
