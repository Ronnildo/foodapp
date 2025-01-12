import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ConnectDbService {
  ConnectDbService._();

  static final ConnectDbService instance = ConnectDbService._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'cardapio.db'),
      onCreate: _onCreate,
      version: 1,
    );
  }

  _onCreate(db, version) async{
    await db.execute(_burgers);
    await db.execute(_drinks);
    await db.execute(_fries);
    await db.execute(_chinkens);
  }

  String get _burgers => '''
    CREATE TABLE burgers (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, descricao TEXT, price DECIMAL, kcal INTEGER, proteins DECIMAL, fats DECIAML, carbo DECIMAL,)
  ''';

  String get _drinks => '''
    CREATE TABLE drinks (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, descricao TEXT, price DECIMAL, kcal INTEGER, proteins DECIMAL, fats DECIAML, carbo DECIMAL,)
  ''';

  String get _fries => '''
    CREATE TABLE friers (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, descricao TEXT, price DECIMAL, kcal INTEGER, proteins DECIMAL, fats DECIAML, carbo DECIMAL,)
  ''';

  String get _chinkens => '''
    CREATE TABLE crinkens (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, descricao TEXT, price DECIMAL, kcal INTEGER, proteins DECIMAL, fats DECIAML, carbo DECIMAL,)
  ''';
}
