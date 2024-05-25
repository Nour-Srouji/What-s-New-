import 'package:news_app/features/data/models/article_source_model.dart';
import 'package:news_app/features/domain/entities/F....article_source_list.dart';

class ArticleSoureListModel extends ArticleSourceList {
  ArticleSoureListModel({required List<ArticleSourceModel> articleSorceListM})
      : super(sources: articleSorceListM);

  factory ArticleSoureListModel.fromJson(List<dynamic> json) {
    List<ArticleSourceModel> art = [];
    for (int i = 0; i < json.length; i++) {
      art.add(ArticleSourceModel.fromJson(json[i]));
    }
    return ArticleSoureListModel(articleSorceListM: art);
  }

  List<Map<String, dynamic>> toJson() {
    List<Map<String, dynamic>> temp = [];
    for (int i = 0; i < sources.length; i++) {
      temp.add((sources[i] as ArticleSourceModel).toJson());
    }
    return temp;
  }
}
