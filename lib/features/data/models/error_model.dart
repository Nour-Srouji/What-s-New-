import 'package:news_app/features/domain/entities/H....error.dart';

class ErrorArticleModel extends ErrorArticle {
  ErrorArticleModel(
      {required String status, required String code, required String message})
      : super(status: status, code: code, message: message);

  factory ErrorArticleModel.fromJson(Map<String, String> json) {
    return ErrorArticleModel(
        status: json["status"]!,
        code: json["code"]!,
        message: json["message"]!);
  }

  Map<String, String> toJson() {
    return {"status": status, "code": code, "message": message};
  }
}
