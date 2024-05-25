import '../../../../core/helpers/one_of.dart';
import '../../../../core/helpers/usecase.dart';
import '../../entities/jobs_entity.dart';
import '../../params/user_jobs_params.dart';
import '../../repositories/jobs_repository.dart';

class GetUserJobs
    implements Usecase<OneOf<JobsEntity, String>, UserJobsParams> {
  final JobsRepository repo;

  GetUserJobs(this.repo);

  @override
  Future<OneOf<JobsEntity, String>> exec(UserJobsParams params) {
    return repo.getUserJobs(params);
  }
}
