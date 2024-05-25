import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/data/models/source_model.dart';
import 'package:collection/collection.dart';

void main() {
  group("testing sourceModel", () {
    test("test convirsion from json to sourceModel class", () {
      SourceModel sourceModel1 = SourceModel(id: null, name: "Techdirt");

      Map<String, String?> json = {"id": null, "name": "Techdirt"};
      SourceModel sourceModel2 = SourceModel.fromJson(json);

      expect(sourceModel1 == sourceModel2, true);
    });

    test("test convirsion from Model to json class", () {
      Map<String, String?> json1 = {"id": null, "name": "Techdirt"};
      SourceModel sourceModel = SourceModel.fromJson(json1);
      Map<String, String?> json2 = sourceModel.toJson();

      expect(const DeepCollectionEquality().equals(json1, json2), true);
    });
  });
}
