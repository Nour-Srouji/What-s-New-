import 'job_params.dart';

class AddJobParams extends JobParams {
  final int userId;

  AddJobParams(
      {required this.userId,
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
    return super.toJson()..addAll({"user_id": userId.toString()});
  }

  @override
  String toString() {
    return '${super.toString()} AddJobParams{user_id: $userId}';
  }
}
