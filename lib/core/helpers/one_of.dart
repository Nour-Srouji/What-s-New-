class OneOf<Data,Error> {
  final Data? data;
  final Error? error;

  OneOf({this.data, this.error});

  @override
  String toString() {
    return 'OneOf{data: $data, error: $error}';
  }
}
