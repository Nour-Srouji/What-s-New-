class ErrorArticle {
  final String status;
  final String code;
  final String message;

  ErrorArticle(
      {required this.status, required this.code, required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ErrorArticle &&
        other.runtimeType == runtimeType &&
        other.status == status &&
        other.code == code &&
        other.message == message;
  }

  @override
  int get hashCode => status.hashCode ^ code.hashCode ^ message.hashCode;
}
