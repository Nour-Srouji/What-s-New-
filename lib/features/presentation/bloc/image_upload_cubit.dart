import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/presentation/bloc/requests_states.dart';

import '../../../core/helpers/one_of.dart';
import '../../data/data_sources/global_data_sources/jobs_data_sources_impl.dart';
import '../../data/repositories/jobs_repository.dart';
import '../../domain/usecases/user_usecases/upload_image.dart';

class ImageUploadCubit extends Cubit<RequestState> {
  ImageUploadCubit() : super(RequestInitial());

  void uploadImage(String path) async {
    emit(RequestLoading());
    OneOf result = await UploadImage(
            JobsRepositoryImpl(jobsDataSources: JobsDataSourcesImpl()))
        .exec(path);
    if (result.error != null) {
      emit(RequestError(result.error!));
    } else {
      RequestState state = RequestData(result.data);
      emit(state);
    }
  }
}
