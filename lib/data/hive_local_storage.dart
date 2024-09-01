
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_hive_todoapp_full_1/model/todo_app_model.dart';

import 'base_local_storage.dart';

class HiveLocalStorage extends BaseLocalStorage{


  static final HiveLocalStorage dbHelperHive = HiveLocalStorage._internal();
  static Box<TodoModel>? db;

  HiveLocalStorage._internal();

  factory HiveLocalStorage(){
    return dbHelperHive;
  }

  Future<Box<TodoModel>> get dbconnect async{
    db ??= Hive.box("todobox");
    return db!;
  }



  @override
  Future<bool> addTodoApp({required TodoModel m}) async{
    final dbx = await dbconnect;
    dbx.put(m.id, m);
    return Future.value(true);
  }

  @override
  Future<List<TodoModel>> allList() async{
    final dbx = await dbconnect;
    List<TodoModel>? _lists = [];
    _lists = await dbx.values.toList();
    return _lists;
  }

  @override
  Future<bool> editTodoApp({required TodoModel m}){
      m.copyWith(id: m.id);
      return Future.value(true);
  }

  @override
  Future<bool> removeTodoApp({required String id}) async{
    final dbx = await dbconnect;
    await dbx.delete(id);
    return true;
  }


}