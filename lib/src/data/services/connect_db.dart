import 'package:cardapioapp/src/domain/models/snacks_models.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class ConnectDbService {
  ConnectDbService._();

  static final ConnectDbService instance = ConnectDbService._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    sqfliteFfiInit();
    return await openDatabase(
      join(await getDatabasesPath(), 'cardapio.db'),
      onCreate: _onCreate,
      version: 1,
    );
  }

  _onCreate(db, version) async {
    await db.execute(_burgers);
    await db.execute(_drinks);
    await db.execute(_fries);
    await db.execute(_chinkens);
    await db.insert(
      "burgers",
      SnacksModels(
        name: "Hamburger Tradicional",
        descricao: "Pão, Tomate, Cebola, Alface, Carne Artesanal e Molho",
        price: 12.50,
        kcal: 128,
        proteins: 24.5,
        fats: 23.2,
        carbo: 32.6,
      ).toJson(),
    );
    await db.insert(
      "chinkens",
      SnacksModels(
        name: "Chinken Beer",
        descricao: "Frango frito, batata e cebola",
        price: 15.50,
        kcal: 122,
        proteins: 21.5,
        fats: 20.2,
        carbo: 18.6,
      ).toJson(),
    );
    await db.insert(
      "fries",
      SnacksModels(
        name: "Batata Pequena",
        descricao: "Batata para uma pessoa",
        price: 10.50,
        kcal: 80,
        proteins: 12.5,
        fats: 19.2,
        carbo: 13.6,
      ).toJson(),
    );
    await db.insert(
      "drinks",
      SnacksModels(
        name: "Coca Cola 200ML",
        descricao: "Coca Cola em lata 200 ML",
        price: 6.50,
        kcal: 80,
        proteins: 63.5,
        fats: 98.2,
        carbo: 25.6,
      ).toJson(),
    );
  }

  String get _burgers => '''
    CREATE TABLE burgers (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, descricao TEXT, price REAL, kcal INTEGER, proteins REAL, fats REAL, carbo REAL)
  ''';

  String get _drinks => '''
    CREATE TABLE drinks (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, descricao TEXT, price REAL, kcal INTEGER, proteins REAL, fats REAL, carbo REAL)
  ''';

  String get _fries => '''
    CREATE TABLE fries (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, descricao TEXT, price REAL, kcal INTEGER, proteins REAL, fats REAL, carbo REAL)
  ''';

  String get _chinkens => '''
    CREATE TABLE chinkens (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, descricao TEXT, price REAL, kcal INTEGER, proteins REAL, fats REAL, carbo REAL)
  ''';
}
