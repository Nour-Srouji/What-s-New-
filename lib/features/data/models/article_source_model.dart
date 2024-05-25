import 'package:news_app/features/domain/entities/E....article_source.dart';

class ArticleSourceModel extends ArticleSource {
  ArticleSourceModel(
      {required String id,
      required String name,
      required String description,
      required String url,
      required String category,
      required String language,
      required String country})
      : super(
            id: id,
            name: name,
            description: description,
            url: url,
            category: category,
            language: language,
            country: country);

  factory ArticleSourceModel.fromJson(Map<String, dynamic> json) {
    return ArticleSourceModel(
        id: json["id"]!,
        name: json["name"]!,
        description: json["description"]!,
        url: json["url"]!,
        category: json["category"]!,
        language: json["language"]!,
        country: json["country"]!);
  }
  Map<String, String> toJson() {
    return {
      "id": id!,
      "name": name!,
      "description": description!,
      "url": url!,
      "category": category!,
      "language": language!,
      "country": country!
    };
  }
}
