import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';

import '../../../core/params/chat_param.dart';
import '../../../core/usecase/usecase_param.dart';
import '../entity/chat_entity.dart';
import '../entity/list_chat_entity.dart';

abstract class IChatRepository {
  Future<DataState<String, MyException>> chatGpt3Turbo({required List<ChatParam> param});
  Future<DataState<ListChatEntity, MyException>> saveListChat({required List<List<ChatEntity>> liChatEntity});
  Future<DataState<NoParam, MyException>> updateListChat({required ListChatEntity liChatEntity});
  Future<DataState<NoParam, MyException>> deleteListChat({required int id});
  Future<DataState<List<ListChatEntity>, MyException>> getAllListChat();
  // Future<DataState<String, MyException>> chatGpt3Turbo({required List<ChatParam> param});
}
