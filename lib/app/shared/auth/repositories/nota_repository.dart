import 'package:clone_keep_flutter/app/models/nota.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'nota_repository_interface.dart';

class NotaRepository implements INotaRepository {
  String collection = 'notas';

  List<Nota> notas = [];

  final databaseReference = Firestore.instance;

  @override
  Future<List<Nota>> findAll() async {
    this.notas = [];
    var response =
        await databaseReference.collection(collection).getDocuments();
    this.notas = response.documents.map((f) {
      Nota t = Nota.fromJson(f.data);
      t.key = f.documentID;
      return t;
    }).toList();
    return this.notas;
  }

  @override
  Future<Nota> findOne(String key) async {
    var response =
        await databaseReference.collection(collection).document(key).get();
    Nota nota = Nota.fromJson(response.data);
    nota.key = response.documentID;
    return nota;
  }

  @override
  Future<void> insert(Nota nota) {
    return databaseReference
        .collection(collection)
        .document()
        .setData(nota.toJson());
  }

  @override
  Future<void> save(Nota nota) {
    if (nota.key == null) {
      return this.insert(nota);
    } else {
      return this.update(nota);
    }
  }

  @override
  Future<void> update(Nota nota) {
    // TODO: implement update
    return null;
  }

  Future<void> delete(Nota nota) {
    return databaseReference.collection(collection).document(nota.key).delete();
  }
}
