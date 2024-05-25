import 'dart:io';

import '../../../core/constants/texts.dart';
import '../../../core/helpers/one_of.dart';
import '../../domain/entities/adding_job_entity.dart';
import '../../domain/entities/jobs_entity.dart';
import '../../domain/entities/status_entity.dart';
import '../../domain/entities/upload_image_entity.dart';
import '../../domain/params/add_job_params.dart';
import '../../domain/params/delete_job_params.dart';
import '../../domain/params/edit_job_params.dart';
import '../../domain/params/user_jobs_params.dart';
import '../../domain/repositories/jobs_repository.dart';
import '../data_sources/global_data_sources/jobs_data_sources.dart';
import '../models/adding_job_model.dart';
import '../models/error_job_model.dart';
import '../models/jobs_model.dart';
import '../models/status_model.dart';
import '../models/upload_image_model.dart';

class JobsRepositoryImpl extends JobsRepository {
  final JobsDataSources jobsDataSources;

  JobsRepositoryImpl({required this.jobsDataSources});

  @override
  Future<OneOf<JobsEntity, String>> getUserJobs(UserJobsParams params) async {
    try {
      var json = await jobsDataSources.getUserJobsData(params);
      return OneOf(data: JobsModel.fromJson(json));
    } on SocketException {
      return OneOf(error: Texts.noInternet);
    } on FormatException {
      return OneOf(error: Texts.errorProcessing);
    } catch (e) {
      return OneOf(error: Texts.requestError);
    }
  }

  @override
  Future<OneOf<JobsEntity, String>> getJobs() async {
    try {
      var json = await jobsDataSources.getJobsData();
      return OneOf(data: JobsModel.fromJson(json));
    } on SocketException {
      return OneOf(error: Texts.noInternet);
    } on FormatException {
      return OneOf(error: Texts.errorProcessing);
    } catch (e) {
      return OneOf(error: Texts.requestError);
    }
  }

  @override
  Future<OneOf<UploadImageEntity, String>> uploadImage(String path) async {
    try {
      var json = await jobsDataSources.uploadImage(path);
      if (StatusModel.fromJson(json).isSuccess) {
        return OneOf(data: UploadImageModel.fromJson(json));
      } else {
        return OneOf(error: ErrorJobModel.fromJson(json).message);
      }
    } on SocketException {
      return OneOf(error: Texts.noInternet);
    } on FormatException {
      return OneOf(error: Texts.errorProcessing);
    } catch (e) {
      return OneOf(error: Texts.requestError);
    }
  }

  @override
  Future<OneOf<AddingJobEntity, String>> addJob(AddJobParams params) async {
    try {
      var json = await jobsDataSources.addJob(params);

      if (StatusModel.fromJson(json).isSuccess) {
        return OneOf(data: AddingJobModel.fromJson(json));
      } else {
        return OneOf(error: ErrorJobModel.fromJson(json).message);
      }
    } on SocketException {
      return OneOf(error: Texts.noInternet);
    } on FormatException {
      return OneOf(error: Texts.errorProcessing);
    } catch (e) {
      return OneOf(error: Texts.requestError);
    }
  }

  @override
  Future<OneOf<StatusEntity, String>> deleteJob(DeleteJobParams params) async {
    try {
      var json = await jobsDataSources.deleteJob(params);
      if (StatusModel.fromJson(json).isSuccess) {
        return OneOf(data: StatusModel.fromJson(json));
      } else {
        return OneOf(error: ErrorJobModel.fromJson(json).message);
      }
    } on SocketException {
      return OneOf(error: Texts.noInternet);
    } on FormatException {
      return OneOf(error: Texts.errorProcessing);
    } catch (e) {
      print(e);
      return OneOf(error: Texts.requestError);
    }
  }

  @override
  Future<OneOf<StatusEntity, String>> editJob(EditJobParams params) async {
    try {
      var json = await jobsDataSources.editJob(params);
      if (StatusModel.fromJson(json).isSuccess) {
        return OneOf(data: StatusModel.fromJson(json));
      } else {
        return OneOf(error: ErrorJobModel.fromJson(json).message);
      }
    } on SocketException {
      return OneOf(error: Texts.noInternet);
    } on FormatException {
      return OneOf(error: Texts.errorProcessing);
    } catch (e) {
      return OneOf(error: Texts.requestError);
    }
  }
}
