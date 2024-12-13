import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import '../../../core/params/comments_param.dart';
import '../entity/comments_entity.dart';
import '../repository/detail_repository.dart';


class CommentsSendUseCase
    implements UseCaseParam<DataState<NoParam, MyException>, CommentsParam> {
  final IDetailRepository _repository;

  const CommentsSendUseCase(this._repository);

  @override
  Future<DataState<NoParam, MyException>> call(CommentsParam param) async {
    return _repository.commentsSend(param: param);
  }
}
