import 'package:news_app/features/domain/entities/B....article.dart';
import 'package:collection/collection.dart';

class ArticleList {
  final List<Article> articles;

  ArticleList({required this.articles});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArticleList &&
        runtimeType == other.runtimeType &&
        const DeepCollectionEquality().equals(other.articles, articles);
  }

  @override
  int get hashCode => articles.hashCode;
}
