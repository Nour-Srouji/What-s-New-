import 'package:news_app/features/data/models/source_model.dart';
import 'package:news_app/features/domain/entities/B....article.dart';

class ArticleModel extends Article {
  ArticleModel(
      {required SourceModel source,
      required String? author,
      required String title,
      required String? description,
      required String url,
      required String? urlToImage,
      required String? publishedAt,
      required String? content})
      : super(
            source: source,
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content);

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        source: SourceModel.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
        content: json["content"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "source": (source as SourceModel).toJson(),
      "author": author,
      "title": title,
      "description": description,
      "url": url,
      "urlToImage": urlToImage,
      "publishedAt": publishedAt,
      "content": content
    };
  }
}
