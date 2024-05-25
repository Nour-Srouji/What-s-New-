import '../../../core/helpers/one_of.dart';
import '../entities/user_entity.dart';
import '../params/user_params.dart';

abstract class UserRepository {
  Future<OneOf<UserEntity, String>> addUser(UserParams params);

  Future<OneOf<UserEntity, String>> checkUser(UserParams params);
}
