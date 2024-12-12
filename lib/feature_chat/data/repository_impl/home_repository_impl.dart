import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:competition/core/utils/data_state.dart';
import 'package:competition/core/utils/my_exception.dart';
import 'package:shamsi_date/shamsi_date.dart';
import '../../../core/params/chat_param.dart';
import '../../../core/usecase/usecase_param.dart';
import '../../../core/utils/base_response.dart';
import '../../domin/entity/chat_entity.dart';
import '../../domin/entity/list_chat_entity.dart';
import '../../domin/repository/chat_repository.dart';
import '../datasource/local/list_chat_dao.dart';
import '../datasource/remote/chat_datasource.dart';

class ChatRepositoryImpl implements IChatRepository {
  final IChatDatasource _datasource;
  final ListChatDao dao;

  const ChatRepositoryImpl(this._datasource,this.dao);

  @override
  Future<DataState<String, MyException>> chatGpt3Turbo(
      {required List<ChatParam> param}) async {
    try {
      return DataState.success(
        await compute(
          _getData,
          await _datasource.chatGpt3Turbo(param: param),
        ),
      );
    } on MyException catch (e) {
      return DataState.error(e);
    } catch (e) {
      if (kDebugMode) {
        rethrow;
      } else {
        return DataState.error(MyException(message: '$e'));
      }
    }
  }

  @override
  Future<DataState<NoParam, MyException>> deleteListChat(
      {required int id}) async {
    try {
      var result = await dao.deleteChatById(id);
      return DataState.success(NoParam());
    } on MyException catch (e) {
      return DataState.error(e);
    } catch (e) {
      if (kDebugMode) {
        rethrow;
      } else {
        return DataState.error(MyException(message: '$e'));
      }
    }
  }

  @override
  Future<DataState<List<ListChatEntity>, MyException>> getAllListChat() async {
    try {
      List<ListChatEntity> result = await dao.findAllListChat();
      return DataState.success(result);
    } on MyException catch (e) {
      return DataState.error(e);
    } catch (e) {
      if (kDebugMode) {
        rethrow;
      } else {
        return DataState.error(MyException(message: '$e'));
      }
    }
  }

  @override
  Future<DataState<ListChatEntity, MyException>> saveListChat(
      {required List<List<ChatEntity>> liChatEntity}) async {
    try {
      final random = Random();
      final randomNumber =
          100000 + random.nextInt(900000); // بازه: 10000 تا 99999
      String listChatRaw = ChatEntityConverter.encode(liChatEntity);
      ListChatEntity chatEntity = ListChatEntity(
        dateTimeCreate: DateTime.timestamp().toJalali().toString(),
        dateTimeUpdate: DateTime.timestamp().toJalali().toString(),
        listChatRaw: listChatRaw,
        id: randomNumber,
      );
      print(chatEntity.id);
      print(chatEntity.dateTimeCreate);
      print(chatEntity.listChatRaw);
      print(chatEntity.dateTimeUpdate);
      var result = await dao.insertChat(chatEntity);
      return DataState.success(chatEntity);
    } on MyException catch (e) {
      return DataState.error(e);
    } catch (e) {
      if (kDebugMode) {
        rethrow;
      } else {
        return DataState.error(MyException(message: '$e'));
      }
    }
  }

  @override
  Future<DataState<NoParam, MyException>> updateListChat(
      {required ListChatEntity liChatEntity}) async {
    try {
      String listChatRaw = ChatEntityConverter.encode(liChatEntity.listChat);
      ListChatEntity chatEntity = ListChatEntity(
          dateTimeUpdate: DateTime.timestamp().toJalali().toString(),
          listChatRaw: listChatRaw,
          dateTimeCreate: liChatEntity.dateTimeCreate,
          id: liChatEntity.id
      );

      var result = await dao.updateChat(chatEntity);
      return DataState.success(NoParam());
    } on MyException catch (e) {
      return DataState.error(e);
    } catch (e) {
      if (kDebugMode) {
        rethrow;
      } else {
        return DataState.error(MyException(message: '$e'));
      }
    }
  }
}

String _getData(dynamic response) {
  return BaseResponse.getData<String>(response, (json) => json['result'][0]);
}