import 'F....article_source_list.dart';

class SearchBySource {
  final String status;
  final ArticleSourceList sources;

  SearchBySource({required this.status, required this.sources});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchBySource &&
        other.status == status &&
        other.runtimeType == runtimeType &&
        other.sources == sources;
  }

  @override
  int get hashCode {
    return status.hashCode ^ sources.hashCode;
  }
}
