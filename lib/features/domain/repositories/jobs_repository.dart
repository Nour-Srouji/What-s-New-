import '../../../core/helpers/one_of.dart';
import '../entities/adding_job_entity.dart';
import '../entities/jobs_entity.dart';
import '../entities/status_entity.dart';
import '../entities/upload_image_entity.dart';
import '../params/add_job_params.dart';
import '../params/delete_job_params.dart';
import '../params/edit_job_params.dart';
import '../params/user_jobs_params.dart';

abstract class JobsRepository {
  Future<OneOf<JobsEntity, String>> getUserJobs(UserJobsParams params);

  Future<OneOf<JobsEntity, String>> getJobs();

  Future<OneOf<UploadImageEntity, String>> uploadImage(String path);

  Future<OneOf<AddingJobEntity, String>> addJob(AddJobParams params);

  Future<OneOf<StatusEntity, String>> editJob(EditJobParams params);

  Future<OneOf<StatusEntity, String>> deleteJob(DeleteJobParams params);
}
