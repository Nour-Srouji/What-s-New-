

//@immutable
//abstract class name{}
class ArticleState {}

class InitialArticleState extends ArticleState {}

class LoadingArticleState extends ArticleState {}

class ErrorArticleState extends ArticleState {
  final String message;

  ErrorArticleState(this.message);
}

class DataArticleState<T> extends ArticleState {
  final T searchModel;
  DataArticleState(
    this.searchModel,
  );
}

class Data2ArticleState<T> extends ArticleState {
  final T searchBySourceModel;

  Data2ArticleState(this.searchBySourceModel);
}
