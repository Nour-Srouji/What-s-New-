abstract class ErrorJobEntity {
  final String message;
  ErrorJobEntity({required this.message});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ErrorJobEntity &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() {
    return 'ErrorEntity{message: $message}';
  }
}
