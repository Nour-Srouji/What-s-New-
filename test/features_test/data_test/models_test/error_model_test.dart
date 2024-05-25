import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/data/models/error_model.dart';
import 'package:news_app/features/domain/entities/H....error.dart';

void main() {
  group("testing errorArticle model", () {
    test("test convirsion from json to errorAticle class", () {
      ErrorArticleModel errorArticleModel = ErrorArticleModel(
          status: "error",
          code: "parametersMissing",
          message: "Required parameters are is too bro, domains.");

      Map<String, String> json = {
        "status": "error",
        "code": "parametersMissing",
        "message": "Required parameters are is too bro, domains."
      };
      ErrorArticle errorArticle2 = ErrorArticleModel.fromJson(json);
      expect(errorArticle2 == errorArticleModel, true);
    });
    /////////////////////////////////////////////////

    test("test convirsion from json to errorAticle class", () {
      Map<String, String> json1 = {
        "status": "error",
        "code": "parametersMissing",
        "message": "Required parameters are is too bro, domains."
      };
      ErrorArticleModel errorArticleModel = ErrorArticleModel.fromJson(json1);

      Map<String, String> json2 = errorArticleModel.toJson();

      expect(json1 == json2, true);
    });
  });
}
