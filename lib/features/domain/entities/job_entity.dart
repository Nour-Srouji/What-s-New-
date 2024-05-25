abstract class JobEntity {
  final int jobId;
  final int userId;
  final String title;
  final String description;
  final String imageUrl;
  final String date;
  final String expirationDate;

  JobEntity(
      {required this.jobId,
      required this.userId,
      required this.imageUrl,
      required this.date,
      required this.description,
      required this.expirationDate,
      required this.title});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobEntity &&
          runtimeType == other.runtimeType &&
          jobId == other.jobId &&
          userId == other.userId &&
          title == other.title &&
          description == other.description &&
          imageUrl == other.imageUrl &&
          date == other.date &&
          expirationDate == other.expirationDate;

  @override
  int get hashCode =>
      jobId.hashCode ^
      userId.hashCode ^
      title.hashCode ^
      description.hashCode ^
      imageUrl.hashCode ^
      date.hashCode ^
      expirationDate.hashCode;

  @override
  String toString() {
    return 'JobEntity{jobId: $jobId, userId: $userId, title: $title, description: $description, imageUrl: $imageUrl, date: $date, expirationDate: $expirationDate}';
  }
}
