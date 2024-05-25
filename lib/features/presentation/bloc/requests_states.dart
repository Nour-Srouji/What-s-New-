abstract class RequestState {
  const RequestState();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RequestState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class RequestInitial extends RequestState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is RequestInitial &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}

class RequestLoading extends RequestState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is RequestLoading &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}

class RequestData<Data> extends RequestState {
  final Data data;

  RequestData(this.data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is RequestData &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => super.hashCode ^ data.hashCode;
}

class RequestError extends RequestState {
  final String errorMessage;

  RequestError(this.errorMessage);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is RequestError &&
          runtimeType == other.runtimeType &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => super.hashCode ^ errorMessage.hashCode;
}