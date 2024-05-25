import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/presentation/bloc/requests_states.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/helpers/one_of.dart';
import '../../data/data_sources/global_data_sources/user_data_sources_impl.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/params/user_params.dart';
import '../../domain/usecases/user_usecases/add_user.dart';
import '../../domain/usecases/user_usecases/check_user.dart';

class AuthCubit extends Cubit<RequestState> {
  static const String _authState = "auth_state";

  AuthCubit() : super(RequestInitial()) {
    loadAuthState();
  }

  void checkUser(UserParams params) async {
    emit(RequestLoading());
    OneOf result = await CheckUser(
            UserRepositoryImpl(userDataSources: UserDataSourcesImpl()))
        .exec(params);
    if (result.error != null) {
      emit(RequestError(result.error!));
    } else {
      RequestState state = RequestData(result.data);
      emit(state);
      saveAuthState(result.data);
    }
  }

  void addUser(UserParams params) async {
    emit(RequestLoading());
    OneOf result = await AddUser(
            UserRepositoryImpl(userDataSources: UserDataSourcesImpl()))
        .exec(params);
    if (result.error != null) {
      emit(RequestError(result.error!));
    } else {
      RequestState state = RequestData(result.data);
      emit(state);
      saveAuthState(result.data);
    }
  }

  void signOut() async {
    clearAuthState();
  }

  void saveAuthState(UserModel data) async {
    var _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(_authState, jsonEncode(data.toJson()));
  }

  void clearAuthState() async {
    var _preferences = await SharedPreferences.getInstance();
    await _preferences.remove(_authState);
  }

  void loadAuthState() async {
    var _preferences = await SharedPreferences.getInstance();
    String? authStateString = _preferences.getString(_authState);
    if (authStateString != null) {
      var model = UserModel.fromJson(jsonDecode(authStateString));
      emit(RequestData(model));
    }
  }
}
