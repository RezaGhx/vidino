import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import '../entity/comments_entity.dart';
import '../repository/detail_repository.dart';


class LikeUseCase
    implements UseCaseParam<DataState<NoParam, MyException>, String> {
  final IDetailRepository _repository;

  const LikeUseCase(this._repository);

  @override
  Future<DataState<NoParam, MyException>> call(String param) async {
    return _repository.like(param: param);
  }
}
