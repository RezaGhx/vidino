import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:competition/core/usecase/usecase_param.dart';
import '../../../core/params/chat_param.dart';
import '../repository/chat_repository.dart';

class ChatUseCase
    implements
        UseCaseParam<DataState<String, MyException>, List<ChatParam>> {
  final IChatRepository _repository;

  const ChatUseCase(this._repository);

  @override
  Future<DataState<String, MyException>> call(List<ChatParam> param) {
    return _repository.chatGpt3Turbo(param:param);
  }
}
