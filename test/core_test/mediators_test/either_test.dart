import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/core/mediators/either.dart';
import 'package:news_app/features/domain/entities/B....article.dart';
import 'package:news_app/features/domain/entities/C....article_list.dart';
import 'package:news_app/features/domain/entities/D....search.dart';
import 'package:news_app/features/domain/entities/A....source.dart';

void main() {
  group("", () {
    test("test for first", () {
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

      final Either<Search, String> either = Either(first: search1);
      expect(either.first != null && either.second == null, true);
    });

    test("test for second", () {
      final Either<Search, String> either = Either(second: "kkk");
      expect(either.second != null && either.first == null, true);
    });
  });
}
