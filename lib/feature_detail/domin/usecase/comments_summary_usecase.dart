import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import '../../../core/params/comments_param.dart';
import '../entity/comments_entity.dart';
import '../repository/detail_repository.dart';


class CommentsSummaryUseCase
    implements UseCaseParam<DataState<String, MyException>, String> {
  final IDetailRepository _repository;

  const CommentsSummaryUseCase(this._repository);

  @override
  Future<DataState<String, MyException>> call(String param) async {
    return _repository.commentsSummary(param: param);
  }
}
