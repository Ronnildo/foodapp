import 'package:cardapioapp/src/data/repository/repository.dart';
import 'package:cardapioapp/src/data/services/connect_db.dart';

class BurgerRepository  implements Repository{
  final ConnectDbService localService;
  BurgerRepository(this.localService);


  @override
  delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  insert(String table) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  read(String table) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  update() {
    // TODO: implement update
    throw UnimplementedError();
  }
}