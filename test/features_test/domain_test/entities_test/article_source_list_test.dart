import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/domain/entities/E....article_source.dart';
import 'package:news_app/features/domain/entities/F....article_source_list.dart';

void main() {
  test("test for ArticlSourceList ", () {
    ArticleSourceList articlSourceList1 = ArticleSourceList(sources: [
      ArticleSource(
          id: "id",
          name: "name",
          description: "description",
          url: "url",
          category: "category",
          language: "language",
          country: "country")
    ]);

    ArticleSourceList articlSourceList2 = ArticleSourceList(sources: [
      ArticleSource(
          id: "id",
          name: "name",
          description: "description",
          url: "url",
          category: "category",
          language: "language",
          country: "country")
    ]);

    expect(articlSourceList1 == articlSourceList2, true);
  });
}
