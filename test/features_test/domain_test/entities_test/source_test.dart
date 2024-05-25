import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/domain/entities/A....source.dart';

void main() {
  test("test for source", () {
    final Source source1 = Source(id: "cars", name: "batman");
    final Source source2 = Source(id: "cars", name: "batman");

    expect(source1 == source2, true);
  });
}
