import '../../../domain/params/user_params.dart';
import 'data_sources_core.dart';

abstract class UserDataSources implements DataSourcesCore {
  static const String addUserMethod = "${DataSourcesCore.api}/add_user.php";

  static const String checkUserMethod = "${DataSourcesCore.api}/check_user.php";

  Future<Map<String, dynamic>> getAddingUserData(UserParams params);

  Future<Map<String, dynamic>> getCheckUserData(UserParams params);
}
