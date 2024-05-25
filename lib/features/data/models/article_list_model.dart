import 'package:news_app/features/data/models/article_model.dart';
import 'package:news_app/features/domain/entities/C....article_list.dart';

class ArticleListModel extends ArticleList {
  ArticleListModel({required List<ArticleModel> articleListM})
      : super(articles: articleListM);

  factory ArticleListModel.fromJson(List<dynamic> json) {
    List<ArticleModel> art = [];
    for (int i = 0; i < json.length; i++) {
      art.add(ArticleModel.fromJson(json[i]));
    }
    return ArticleListModel(articleListM: art);
  }

  List<Map<String, dynamic>> toJson() {
    List<Map<String, dynamic>> temp = [];
    for (int i = 0; i < articles.length; i++) {
      temp.add((articles[i] as ArticleModel).toJson());
    }
    return temp;
  }
}
