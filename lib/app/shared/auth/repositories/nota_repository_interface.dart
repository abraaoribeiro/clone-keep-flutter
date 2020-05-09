import 'package:clone_keep_flutter/app/models/nota.dart';

abstract class INotaRepository {
  
  Future<void> save(Nota nota);
  
  Future<void> insert(Nota nota);

  Future<void> update(Nota nota);

  Future<List<Nota>> findAll();
  
  Future<Nota> findOne(String key);  

}
