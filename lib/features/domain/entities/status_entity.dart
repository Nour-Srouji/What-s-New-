abstract class StatusEntity {
  final String status;

  StatusEntity({required this.status});

  get isSuccess => status == "success";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusEntity &&
          runtimeType == other.runtimeType &&
          status == other.status;

  @override
  int get hashCode => status.hashCode;

  @override
  String toString() {
    return 'StatusEntity{status: $status}';
  }
}
