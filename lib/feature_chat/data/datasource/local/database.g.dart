// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ListChatDao? _liiChatDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ListChatEntity` (`id` INTEGER, `listChatRaw` TEXT NOT NULL, `dateTimeCreate` TEXT NOT NULL, `dateTimeUpdate` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ListChatDao get liiChatDao {
    return _liiChatDaoInstance ??= _$ListChatDao(database, changeListener);
  }
}

class _$ListChatDao extends ListChatDao {
  _$ListChatDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _listChatEntityInsertionAdapter = InsertionAdapter(
            database,
            'ListChatEntity',
            (ListChatEntity item) => <String, Object?>{
                  'id': item.id,
                  'listChatRaw': item.listChatRaw,
                  'dateTimeCreate': item.dateTimeCreate,
                  'dateTimeUpdate': item.dateTimeUpdate
                },
            changeListener),
        _listChatEntityUpdateAdapter = UpdateAdapter(
            database,
            'ListChatEntity',
            ['id'],
            (ListChatEntity item) => <String, Object?>{
                  'id': item.id,
                  'listChatRaw': item.listChatRaw,
                  'dateTimeCreate': item.dateTimeCreate,
                  'dateTimeUpdate': item.dateTimeUpdate
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ListChatEntity> _listChatEntityInsertionAdapter;

  final UpdateAdapter<ListChatEntity> _listChatEntityUpdateAdapter;

  @override
  Future<List<ListChatEntity>> findAllListChat() async {
    return _queryAdapter.queryList('SELECT * FROM ListChatEntity',
        mapper: (Map<String, Object?> row) => ListChatEntity(
            id: row['id'] as int?,
            listChatRaw: row['listChatRaw'] as String,
            dateTimeCreate: row['dateTimeCreate'] as String,
            dateTimeUpdate: row['dateTimeUpdate'] as String));
  }

  @override
  Stream<ListChatEntity?> findChatById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM ListChatEntity WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ListChatEntity(
            id: row['id'] as int?,
            listChatRaw: row['listChatRaw'] as String,
            dateTimeCreate: row['dateTimeCreate'] as String,
            dateTimeUpdate: row['dateTimeUpdate'] as String),
        arguments: [id],
        queryableName: 'ListChatEntity',
        isView: false);
  }

  @override
  Future<void> deleteChatById(int id) async {
    await _queryAdapter.queryNoReturn(
        'SELECT * FROM ListChatEntity WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertChat(ListChatEntity liChatEntity) async {
    await _listChatEntityInsertionAdapter.insert(
        liChatEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateChat(ListChatEntity user) async {
    await _listChatEntityUpdateAdapter.update(user, OnConflictStrategy.abort);
  }
}