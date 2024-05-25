class UserJobsParams {
  final int userId;

  UserJobsParams({required this.userId});

  Map<String, String> toJson() {
    return {
      "user_id": userId.toString(),
    };
  }

  @override
  String toString() {
    return 'UserJobsParams{userId: $userId}';
  }
}
