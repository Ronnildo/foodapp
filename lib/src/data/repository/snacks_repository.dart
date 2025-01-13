import 'package:cardapioapp/src/data/repository/repository.dart';
import 'package:cardapioapp/src/data/services/connect_db.dart';
import 'package:cardapioapp/src/domain/models/snacks_models.dart';
import 'package:sqflite/sqflite.dart';

class SnacksRepository implements Repository {
  late Database database;
  @override
  insert(String table, SnacksModels snack) async {
    database = await ConnectDbService.instance.database;

    try {
      await database.insert(table, snack.toJson());

      return "Snack insert success.";
    } on DatabaseException catch (e) {
      return e;
    }
  }

  @override
  Future<List<SnacksModels>> read(String table) async {
    database = await ConnectDbService.instance.database;
    try {
      List<Map> data = await database.query(table);
      
      return [
        for (final {
              "id": id as int,
              "name": name as String,
              "descricao": descricao as String,
              "price": price as double,
              "kcal": kcal as int,
              "proteins": proteins as double,
              "fats": fats as double,
              "carbo": carbo as double,
            } in data)
          SnacksModels(
            id: id,
            name: name,
            descricao: descricao,
            price: price,
            kcal: kcal,
            proteins: proteins,
            fats: fats,
            carbo: carbo,
          ),
      ];
    } on DatabaseException catch (e) {
      return [];
    }
  }

  Future<List<SnacksModels>> recomendedSnacks() async {
    database = await ConnectDbService.instance.database;
    try {
      List<Map> data = await database.query("burgers", limit: 4);
      return [
        for (final {
              "id": id as int,
              "name": name as String,
              "descricao": descricao as String,
              "price": price as double,
              "kcal": kcal as int,
              "proteins": proteins as double,
              "fats": fats as double,
              "carbo": carbo as double,
            } in data)
          SnacksModels(
            id: id,
            name: name,
            descricao: descricao,
            price: price,
            kcal: kcal,
            proteins: proteins,
            fats: fats,
            carbo: carbo,
          ),
      ];
    } on DatabaseException catch (e) {
      return [];
    }
  }
}

