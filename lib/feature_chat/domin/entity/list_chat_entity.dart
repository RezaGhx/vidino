import 'dart:convert';

import 'package:floor/floor.dart';
import '../../data/model/chat_model.dart';
import 'chat_entity.dart';


@entity
class ListChatEntity {
  @primaryKey
  final int? id;

  // ذخیره‌شده به‌عنوان String
  final String listChatRaw;

  final String dateTimeCreate;

  final String dateTimeUpdate;

  ListChatEntity( {
    this.id,
    required this.listChatRaw,
    required this.dateTimeCreate,
    required this.dateTimeUpdate,
  });

  // دسترسی به داده‌ها به صورت List<List<ChatEntity>>
  List<List<ChatEntity>> get listChat => ChatEntityConverter.decode(listChatRaw);

  // ایجاد یک Entity از داده‌ها
  factory ListChatEntity.create(String newDateTimeCreate,String newDateTimeUpdate,int id, List<List<ChatEntity>> listChat) {
    return ListChatEntity(
      dateTimeCreate: newDateTimeCreate ,
      dateTimeUpdate: newDateTimeUpdate,
      id: id,
      listChatRaw: ChatEntityConverter.encode(listChat),
    );
  }
}

class ChatEntityConverter {
  // تبدیل List<List<ChatEntity>> به String
  static String encode(List<List<ChatEntity>> listChat) {
    print("objectobjectobject");
    print(listChat.length);
    return jsonEncode(listChat.map((innerList) {
      return innerList.map((chatEntity) {
        // تبدیل ChatEntity به ChatModel و سپس به JSON
        return ChatModel(
          role: chatEntity.role,
          content: chatEntity.content,
        ).toJson();
      }).toList();
    }).toList());
  }



  static List<List<ChatEntity>> decode(String listChat) {
    print('Decoding listChatRaw: $listChat');
    final List<dynamic> jsonData = jsonDecode(listChat);
    print('Decoded JSON: $jsonData');
    return jsonData.map((innerList) {
      return (innerList as List<dynamic>).map((item) {
        final model = ChatModel.fromJson(item as Map<String, dynamic>);
        return ChatEntity(
          role: model.role,
          content: model.content,
        );
      }).toList();
    }).toList();
  }
}

