class ArticleSource {
  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;

  ArticleSource(
      {required this.id,
      required this.name,
      required this.description,
      required this.url,
      required this.category,
      required this.language,
      required this.country});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArticleSource &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.url == url &&
        other.category == category &&
        other.language == language &&
        other.country == country;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        url.hashCode ^
        category.hashCode ^
        language.hashCode ^
        country.hashCode;
  }
}
