import 'package:competition/core/params/profile_param.dart';
import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import 'package:competition/feature_home/domain/repository/home_repository.dart';

import '../entity/list_item_category_entity.dart';


class ListItemCategoryUseCase
    implements UseCaseParam<DataState<List<ListItemCategoryEntity>, MyException>, NoParam> {
  final IHomeRepository _repository;

  const ListItemCategoryUseCase(this._repository);

  @override
  Future<DataState<List<ListItemCategoryEntity>, MyException>> call(NoParam param) async {
    return _repository.categories();
  }
}
