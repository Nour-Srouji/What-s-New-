import 'package:dio/dio.dart';

class DioSingleton {
  static Dio? _instance;

  DioSingleton._();

  static Dio getInstance() {
    _instance ??= Dio();
    return _instance!;
  }
}
