import '../../../../core/helpers/one_of.dart';
import '../../../../core/helpers/usecase.dart';
import '../../entities/status_entity.dart';
import '../../params/edit_job_params.dart';
import '../../repositories/jobs_repository.dart';

class EditJob implements Usecase<OneOf<StatusEntity, String>, EditJobParams> {
  final JobsRepository repo;

  EditJob(this.repo);

  @override
  Future<OneOf<StatusEntity, String>> exec(EditJobParams params) {
    return repo.editJob(params);
  }
}
