import 'package:cardapioapp/src/domain/models/snacks_models.dart';
import 'package:result_dart/result_dart.dart';

abstract class Repository {
  insert(String table, SnacksModels snack);
  read(String table);
}