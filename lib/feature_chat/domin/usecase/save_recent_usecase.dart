import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import '../../../core/params/chat_param.dart';
import '../entity/chat_entity.dart';
import '../entity/list_chat_entity.dart';
import '../repository/chat_repository.dart';

class SaveRecentUseCase
    implements
        UseCaseParam<DataState<ListChatEntity, MyException>, List<List<ChatEntity>> > {
  final IChatRepository _repository;

  const SaveRecentUseCase(this._repository);

  @override
  Future<DataState<ListChatEntity, MyException>> call(List<List<ChatEntity>> param) {
    return _repository.saveListChat(liChatEntity: param);
  }
}
