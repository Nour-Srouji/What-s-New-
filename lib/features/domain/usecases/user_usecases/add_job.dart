import '../../../../core/helpers/one_of.dart';
import '../../../../core/helpers/usecase.dart';
import '../../entities/adding_job_entity.dart';
import '../../params/add_job_params.dart';
import '../../repositories/jobs_repository.dart';

class AddJob implements Usecase<OneOf<AddingJobEntity, String>, AddJobParams> {
  final JobsRepository repo;

  AddJob(this.repo);

  @override
  Future<OneOf<AddingJobEntity, String>> exec(AddJobParams params) {
    return repo.addJob(params);
  }
}
