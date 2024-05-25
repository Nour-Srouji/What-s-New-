import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/presentation/bloc/requests_states.dart';

import '../../../core/helpers/one_of.dart';
import '../../data/data_sources/global_data_sources/jobs_data_sources_impl.dart';
import '../../data/models/jobs_model.dart';
import '../../data/repositories/jobs_repository.dart';
import '../../domain/entities/job_entity.dart';
import '../../domain/params/add_job_params.dart';
import '../../domain/params/delete_job_params.dart';
import '../../domain/params/edit_job_params.dart';
import '../../domain/params/no_params.dart';
import '../../domain/params/user_jobs_params.dart';
import '../../domain/usecases/jobs_usecases/get_jobs.dart';
import '../../domain/usecases/jobs_usecases/get_user_jobs.dart';
import '../../domain/usecases/user_usecases/add_job.dart';
import '../../domain/usecases/user_usecases/delete_job.dart';
import '../../domain/usecases/user_usecases/edit_job.dart';

class JobsCubit extends Cubit<RequestState> {
  JobsCubit() : super(RequestInitial());

  void getJobs([UserJobsParams? params, bool withLoad = true]) async {
    if (withLoad) {
      emit(RequestLoading());
    }
    OneOf result;
    if (params == null) {
      result = await GetJobs(
              JobsRepositoryImpl(jobsDataSources: JobsDataSourcesImpl()))
          .exec(NoParams());
    } else {
      result = await GetUserJobs(
              JobsRepositoryImpl(jobsDataSources: JobsDataSourcesImpl()))
          .exec(params);
    }
    if (result.error != null && withLoad) {
      emit(RequestError(result.error!));
    } else {
      RequestState state = RequestData(result.data);
      emit(state);
    }
  }

  void editJob(JobEntity model, int index) async {
    OneOf result;
    result = await EditJob(
            JobsRepositoryImpl(jobsDataSources: JobsDataSourcesImpl()))
        .exec(EditJobParams(
            jobId: model.jobId,
            imageUrl: model.imageUrl,
            date: model.date,
            description: model.description,
            expirationDate: model.expirationDate,
            title: model.title));
    if (result.error != null) {
      emit(RequestError(result.error!));
    } else {
      getJobs(UserJobsParams(userId: model.userId), false);
    }
  }

  void addJob(AddJobParams params) async {
    OneOf result;
    result =
        await AddJob(JobsRepositoryImpl(jobsDataSources: JobsDataSourcesImpl()))
            .exec(params);
    if (result.error != null) {
      emit(RequestError(result.error!));
    } else {
      getJobs(UserJobsParams(userId: params.userId), false);
    }
  }

  void deleteJob(DeleteJobParams params, int index) async {
    OneOf result;
    result = await DeleteJob(
            JobsRepositoryImpl(jobsDataSources: JobsDataSourcesImpl()))
        .exec(params);
    if (result.error != null) {
      emit(RequestError(result.error!));
    } else {
      RequestData stateT = state as RequestData;
      JobsModel jobs = stateT.data as JobsModel;
      jobs.jobs.removeAt(index);
      emit(RequestData(jobs));
    }
  }
}
