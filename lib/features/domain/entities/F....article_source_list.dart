import 'package:collection/collection.dart';

import 'E....article_source.dart';

class ArticleSourceList {
  final List<ArticleSource> sources;
  ArticleSourceList({
    required this.sources,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArticleSourceList &&
        const DeepCollectionEquality().equals(other.sources, sources);
  }

  @override
  int get hashCode => sources.hashCode;
}
