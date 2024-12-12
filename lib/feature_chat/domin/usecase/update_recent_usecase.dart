import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import '../../../core/params/chat_param.dart';
import '../entity/list_chat_entity.dart';
import '../repository/chat_repository.dart';

class UpdateRecentUseCase
    implements
        UseCaseParam<DataState<NoParam, MyException>, ListChatEntity > {
  final IChatRepository _repository;

  const UpdateRecentUseCase(this._repository);

  @override
  Future<DataState<NoParam, MyException>> call(ListChatEntity param) {
    return _repository.updateListChat(liChatEntity: param);
  }
}
