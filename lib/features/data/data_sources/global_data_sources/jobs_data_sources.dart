import '../../../domain/params/add_job_params.dart';
import '../../../domain/params/delete_job_params.dart';
import '../../../domain/params/edit_job_params.dart';
import '../../../domain/params/user_jobs_params.dart';
import 'data_sources_core.dart';

abstract class JobsDataSources implements DataSourcesCore {
  static const String userJobsMethod =
      "${DataSourcesCore.api}/get_user_jobs.php";

  static const String jobsMethod = "${DataSourcesCore.api}/get_jobs.php";

  static const String imageUploadMethod =
      "${DataSourcesCore.api}/upload_image.php";

  static const String deleteJobMethod = "${DataSourcesCore.api}/delete_job.php";

  static const String addJobMethod = "${DataSourcesCore.api}/add_job.php";

  static const String editJobMethod = "${DataSourcesCore.api}/edit_job.php";

  Future<List<dynamic>> getUserJobsData(UserJobsParams params);

  Future<List<dynamic>> getJobsData();

  Future<Map<String, dynamic>> uploadImage(String image);

  Future<Map<String, dynamic>> editJob(EditJobParams params);

  Future<Map<String, dynamic>> addJob(AddJobParams params);

  Future<Map<String, dynamic>> deleteJob(DeleteJobParams params);
}
