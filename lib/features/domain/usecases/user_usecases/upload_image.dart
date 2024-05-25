import '../../../../core/helpers/one_of.dart';
import '../../../../core/helpers/usecase.dart';
import '../../entities/upload_image_entity.dart';
import '../../repositories/jobs_repository.dart';

class UploadImage implements Usecase<OneOf<UploadImageEntity, String>, String> {
  final JobsRepository repo;

  UploadImage(this.repo);

  @override
  Future<OneOf<UploadImageEntity, String>> exec(String path) {
    return repo.uploadImage(path);
  }
}
