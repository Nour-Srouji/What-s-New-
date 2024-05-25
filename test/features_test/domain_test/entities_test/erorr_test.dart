import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/domain/entities/H....error.dart';

void main() {
  test('test for erorr', () {
    final ErrorArticle erorr1 = ErrorArticle(
        status: "error",
        code: "parametersMissing",
        message: "Required parameters are missin");

    final ErrorArticle erorr2 = ErrorArticle(
        status: "error",
        code: "parametersMissing",
        message: "Required parameters are missin");

    expect(erorr1 == erorr2, true);
  });
}
