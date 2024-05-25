import 'job_params.dart';

class EditJobParams extends JobParams {
  final int jobId;

  EditJobParams(
      {required this.jobId,
      required String imageUrl,
      required String date,
      required String description,
      required String expirationDate,
      required String title})
      : super(
            title: title,
            date: date,
            description: description,
            expirationDate: expirationDate,
            imageUrl: imageUrl);

  Map<String, dynamic> toJson() {
    return super.toJson()..addAll({"job_id": jobId.toString()});
  }

  @override
  String toString() {
    return '${super.toString()} EditJobParams{jobId: $jobId}';
  }
}
