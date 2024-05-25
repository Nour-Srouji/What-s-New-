import '../../../../core/helpers/one_of.dart';
import '../../../../core/helpers/usecase.dart';
import '../../entities/jobs_entity.dart';
import '../../params/no_params.dart';
import '../../repositories/jobs_repository.dart';

class GetJobs implements Usecase<OneOf<JobsEntity, String>, NoParams> {
  final JobsRepository repo;

  GetJobs(this.repo);

  @override
  Future<OneOf<JobsEntity, String>> exec(NoParams params) {
    return repo.getJobs();
  }
}
