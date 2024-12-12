import 'package:competition/core/params/get_pages_param.dart';
import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import 'package:competition/feature_home/domain/repository/home_repository.dart';

import '../entity/list_item_media_entity.dart';


class ListItemMediaUseCase
    implements UseCaseParam<DataState<List<ListItemMediaEntity>, MyException>, GetPagesParam> {
  final IHomeRepository _repository;

  const ListItemMediaUseCase(this._repository);

  @override
  Future<DataState<List<ListItemMediaEntity>, MyException>> call(GetPagesParam param) async {
    return _repository.medias(param: param);
  }
}
