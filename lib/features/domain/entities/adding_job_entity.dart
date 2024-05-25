abstract class AddingJobEntity{
  final int jobId;
  AddingJobEntity(this.jobId);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddingJobEntity &&
          runtimeType == other.runtimeType &&
          jobId == other.jobId;

  @override
  int get hashCode => jobId.hashCode;

  @override
  String toString() {
    return 'AddingJobEntity{jobId: $jobId}';
  }
}