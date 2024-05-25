import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/domain/entities/E....article_source.dart';
import 'package:news_app/features/domain/entities/F....article_source_list.dart';
import 'package:news_app/features/domain/entities/G....search_by_source.dart';

void main() {
  /// final ArticlSourceList artSrcList;

  test("test for search By Source", () {
    SearchBySource searchBySource1 = SearchBySource(
        status: "status",
        sources: ArticleSourceList(sources: [
          ArticleSource(
              id: "id",
              name: "name",
              description: "description",
              url: "url",
              category: "category",
              language: "language",
              country: "country"),
          ArticleSource(
              id: "id",
              name: "name",
              description: "description",
              url: "url",
              category: "category",
              language: "language",
              country: "country")
        ]));
    /////////////////////////////////////////////////////////////////////////////
    SearchBySource searchBySource2 = SearchBySource(
        status: "status",
        sources: ArticleSourceList(sources: [
          ArticleSource(
              id: "id",
              name: "name",
              description: "description",
              url: "url",
              category: "category",
              language: "language",
              country: "country"),
          ArticleSource(
              id: "id",
              name: "name",
              description: "description",
              url: "url",
              category: "category",
              language: "language",
              country: "country")
        ]));
//////////////////////////////////////////////////////////////////////////////
    expect(searchBySource1 == searchBySource2, true);
  });
}
