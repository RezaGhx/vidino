import 'package:floor/floor.dart';

import '../../../domin/entity/list_chat_entity.dart';

@dao
abstract class ListChatDao {
  @Query('SELECT * FROM ListChatEntity')
  Future<List<ListChatEntity>> findAllListChat();

  @Query('SELECT * FROM ListChatEntity WHERE id = :id')
  Stream<ListChatEntity?> findChatById(int id);

  @Query('SELECT * FROM ListChatEntity WHERE id = :id')
  Future<void> deleteChatById(int id);

  @insert
  Future<void> insertChat(ListChatEntity liChatEntity);

  @update
  Future<void> updateChat(ListChatEntity user);
}