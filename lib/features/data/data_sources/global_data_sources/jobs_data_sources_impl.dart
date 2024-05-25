import 'package:dio/dio.dart';

import '../../../../core/services/dio_singleton.dart';
import '../../../domain/params/add_job_params.dart';
import '../../../domain/params/delete_job_params.dart';
import '../../../domain/params/edit_job_params.dart';
import '../../../domain/params/user_jobs_params.dart';
import 'jobs_data_sources.dart';

class JobsDataSourcesImpl implements JobsDataSources {
  @override
  Future<Map<String, dynamic>> uploadImage(String path) async {
    final response = await DioSingleton.getInstance().post(
        JobsDataSources.imageUploadMethod,
        data: FormData.fromMap({"image": await MultipartFile.fromFile(path)}));
    return response.data;
  }

  @override
  Future<List<dynamic>> getUserJobsData(UserJobsParams params) async {
    final response = await DioSingleton.getInstance()
        .get(JobsDataSources.userJobsMethod, queryParameters: params.toJson());
    return response.data;
  }

  @override
  Future<List<dynamic>> getJobsData() async {
    final response =
        await DioSingleton.getInstance().get(JobsDataSources.jobsMethod);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> addJob(AddJobParams params) async {
    final response = await DioSingleton.getInstance().post(
        JobsDataSources.addJobMethod,
        data: FormData.fromMap(params.toJson()));
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> deleteJob(DeleteJobParams params) async {
    final response = await DioSingleton.getInstance().post(
        JobsDataSources.deleteJobMethod,
        data: FormData.fromMap(params.toJson()));
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> editJob(EditJobParams params) async {
    final response = await DioSingleton.getInstance().post(
        JobsDataSources.editJobMethod,
        data: FormData.fromMap(params.toJson()));
    return response.data;
  }
}
