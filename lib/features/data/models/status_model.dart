import '../../domain/entities/status_entity.dart';

class StatusModel extends StatusEntity {
  StatusModel({required String status}) : super(status: status);

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(status: json["status"]);
  }
}
