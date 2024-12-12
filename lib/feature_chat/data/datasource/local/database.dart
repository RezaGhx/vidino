import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../domin/entity/list_chat_entity.dart';
import 'list_chat_dao.dart';




part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [ListChatEntity])
abstract class AppDatabase extends FloorDatabase {
  ListChatDao get liiChatDao;
}