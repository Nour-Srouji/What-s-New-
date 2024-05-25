import 'package:news_app/features/data/models/article_list_model.dart';
import 'package:news_app/features/domain/entities/D....search.dart';

class SearchModel extends Search {
  SearchModel({
    required String status,
    required int totalResults,
    required ArticleListModel articles,
  }) : super(article: articles, status: status, totalResults: totalResults);

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: ArticleListModel.fromJson(json["articles"]));
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "totalResults": totalResults,
      "articles": (article as ArticleListModel).toJson()
    };
  }
}
