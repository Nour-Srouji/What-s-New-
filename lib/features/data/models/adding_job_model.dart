import '../../domain/entities/adding_job_entity.dart';

class AddingJobModel extends AddingJobEntity {
  AddingJobModel(int jobId) : super(jobId);

  factory AddingJobModel.fromJson(Map<String, dynamic> json) {
    return AddingJobModel(json["job_id"]);
  }
}
