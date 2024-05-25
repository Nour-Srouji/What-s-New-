import 'package:news_app/features/data/models/article_source_list_model.dart';
import 'package:news_app/features/domain/entities/G....search_by_source.dart';

class SearchBySourceModel extends SearchBySource {
  SearchBySourceModel(
      {required String status, required ArticleSoureListModel sources})
      : super(status: status, sources: sources);

  factory SearchBySourceModel.fromJson(Map<String, dynamic> json) {
    return SearchBySourceModel(
        status: json["status"]!,
        sources: ArticleSoureListModel.fromJson(json["sources"]));
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "sources": (sources as ArticleSoureListModel).toJson()
    };
  }
}
