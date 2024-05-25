import '../../domain/entities/job_entity.dart';

class JobModel extends JobEntity {
  JobModel(
      {required int userId,
      required int jobId,
      required String expirationDate,
      required String description,
      required String title,
      required String imageUrl,
      required String date})
      : super(
            userId: userId,
            date: date,
            description: description,
            expirationDate: expirationDate,
            imageUrl: imageUrl,
            jobId: jobId,
            title: title);

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
        jobId: json["id"],
        imageUrl: json["image_url"],
        expirationDate: json["expiration_date"],
        description: json["description"],
        date: json["date"],
        userId: json["user_id"],
        title: json["title"]);
  }
}
