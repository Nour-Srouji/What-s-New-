import 'package:dio/dio.dart';
import 'package:news_app/features/data/data_sources/global_data_sources/user_data_sources.dart';

import '../../../../core/services/dio_singleton.dart';
import '../../../domain/params/user_params.dart';

class UserDataSourcesImpl implements UserDataSources {
  @override
  Future<Map<String, dynamic>> getAddingUserData(UserParams params) async {
    final response = await DioSingleton.getInstance().post(
        UserDataSources.addUserMethod,
        data: FormData.fromMap(params.toJson()));
    print(response.data);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> getCheckUserData(UserParams params) async {
    final response = await DioSingleton.getInstance().post(
        UserDataSources.checkUserMethod,
        data: FormData.fromMap(params.toJson()));
    return response.data;
  }
}
