import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/domain/entities/E....article_source.dart';

void main() {
  test("test for article_source", () {
    final ArticleSource articaleSource1 = ArticleSource(
        id: "id",
        name: "name",
        description: "description",
        url: "url",
        category: "category",
        language: "language",
        country: "country");

    final ArticleSource articaleSource2 = ArticleSource(
        id: "id",
        name: "name",
        description: "description",
        url: "url",
        category: "category",
        language: "language",
        country: "country");

    expect(articaleSource1 == articaleSource2, true);
  });
}
