import '../../domain/entities/upload_image_entity.dart';
import '../data_sources/global_data_sources/data_sources_core.dart';

class UploadImageModel extends UploadImageEntity {
  UploadImageModel(String imageUrl) : super(imageUrl);

  factory UploadImageModel.fromJson(Map<String, dynamic> json) {
    return UploadImageModel((json["image_url"] as String)
        .replaceAll("localhost", DataSourcesCore.ip));
  }
}
