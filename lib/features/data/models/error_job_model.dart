import '../../domain/entities/error_job_entity.dart';

class ErrorJobModel extends ErrorJobEntity {
  ErrorJobModel({required String message}) : super(message: message);

  factory ErrorJobModel.fromJson(Map<String, dynamic> json) {
    return ErrorJobModel(message: json["message"]);
  }
}
