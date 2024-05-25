import '../../domain/entities/jobs_entity.dart';
import 'job_model.dart';

class JobsModel extends JobsEntity {
  JobsModel(List<JobModel> jobs) : super(jobs);

  factory JobsModel.fromJson(List<dynamic> json) {
    List<JobModel> jobs = [];
    for (int i = 0; i < json.length; i++) {
      jobs.add(JobModel.fromJson(json[i]));
    }
    return JobsModel(jobs);
  }
}
