import 'package:news_app/features/domain/entities/A....source.dart';

class SourceModel extends Source {
  SourceModel({required String? id, required String? name})
      : super(id: id, name: name);

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(id: json["id"], name: json["name"]!);
  }

  Map<String, String?> toJson() {
    return {"id": id, "name": name};
  }
}
