import '../../../../core/helpers/one_of.dart';
import '../../../../core/helpers/usecase.dart';
import '../../entities/status_entity.dart';
import '../../params/delete_job_params.dart';
import '../../repositories/jobs_repository.dart';

class DeleteJob
    implements Usecase<OneOf<StatusEntity, String>, DeleteJobParams> {
  final JobsRepository repo;

  DeleteJob(this.repo);

  @override
  Future<OneOf<StatusEntity, String>> exec(DeleteJobParams params) {
    return repo.deleteJob(params);
  }
}
