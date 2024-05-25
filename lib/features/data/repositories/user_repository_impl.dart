import 'dart:io';

import '../../../core/constants/texts.dart';
import '../../../core/helpers/one_of.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/params/user_params.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/global_data_sources/user_data_sources.dart';
import '../models/error_job_model.dart';
import '../models/status_model.dart';
import '../models/user_model.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDataSources userDataSources;

  UserRepositoryImpl({required this.userDataSources});

  @override
  Future<OneOf<UserEntity, String>> addUser(UserParams params) async {
    try {
      var json = await userDataSources.getAddingUserData(params);
      if (StatusModel.fromJson(json).isSuccess) {
        return OneOf(data: UserModel.fromJson(json));
      } else {
        return OneOf(error: ErrorJobModel.fromJson(json).message);
      }
    } on SocketException {
      return OneOf(error: Texts.noInternet);
    } on FormatException {
      return OneOf(error: Texts.errorProcessing);
    } catch (e) {
      return OneOf(error: Texts.requestError);
    }
  }

  @override
  Future<OneOf<UserEntity, String>> checkUser(UserParams params) async {
    try {
      var json = await userDataSources.getCheckUserData(params);
      if (StatusModel.fromJson(json).isSuccess) {
        return OneOf(data: UserModel.fromJson(json));
      } else {
        return OneOf(error: ErrorJobModel.fromJson(json).message);
      }
    } on SocketException {
      return OneOf(error: Texts.noInternet);
    } on FormatException {
      return OneOf(error: Texts.errorProcessing);
    } catch (e) {
      return OneOf(error: Texts.requestError);
    }
  }
}
