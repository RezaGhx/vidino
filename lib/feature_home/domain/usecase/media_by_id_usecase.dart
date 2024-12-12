import 'package:competition/core/params/get_pages_param.dart';
import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import 'package:competition/feature_home/domain/repository/home_repository.dart';

import '../entity/list_item_media_entity.dart';


class MediaByIdUseCase
    implements UseCaseParam<DataState<ListItemMediaEntity, MyException>, String> {
  final IHomeRepository _repository;

  const MediaByIdUseCase(this._repository);

  @override
  Future<DataState<ListItemMediaEntity, MyException>> call(String param) async {
    return _repository.mediaByID(param: param);
  }
}
