import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import '../entity/list_chat_entity.dart';
import '../repository/chat_repository.dart';

class GetRecentUseCase
    implements
        UseCaseParam<DataState<List<ListChatEntity>, MyException>, NoParam> {
  final IChatRepository _repository;

  const GetRecentUseCase(this._repository);

  @override
  Future<DataState<List<ListChatEntity>, MyException>> call(NoParam param) {
    return _repository.getAllListChat();
  }
}
