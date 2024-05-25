class DeleteJobParams {
  final int jobId;

  DeleteJobParams({required this.jobId});

  Map<String, String> toJson() {
    return {
      "job_id": jobId.toString(),
    };
  }

  @override
  String toString() {
    return 'DeleteJobParams{jobId: $jobId}';
  }
}
