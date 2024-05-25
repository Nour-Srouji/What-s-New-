import 'package:news_app/features/domain/entities/C....article_list.dart';

class Search {
  final String status;
  final int totalResults;
  final ArticleList article;

  Search({
    required this.status,
    required this.totalResults,
    required this.article,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Search &&
        runtimeType == other.runtimeType &&
        other.status == status &&
        other.totalResults == totalResults &&
        other.article == article;
  }

  @override
  int get hashCode =>
      status.hashCode ^ totalResults.hashCode ^ article.hashCode;
}
