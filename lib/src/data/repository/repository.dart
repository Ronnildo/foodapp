abstract class Repository<T> {
  Future<T> insert(String table);
  Future<T> delete();
  Future<T> read(String table);
  Future<T> update();
}