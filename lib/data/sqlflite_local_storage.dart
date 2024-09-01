import 'package:riverpod_hive_todoapp_full_1/model/todo_app_model.dart';

import 'base_local_storage.dart';

class SqlfliteLocal extends BaseLocalStorage{

  @override
  Future<bool> addTodoApp({required TodoModel m}) {
    // TODO: implement addTodoApp
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> allList() {
    // TODO: implement allList
    throw UnimplementedError();
  }

  @override
  Future<bool> editTodoApp({required TodoModel m}) {
    // TODO: implement editTodoApp
    throw UnimplementedError();
  }

  @override
  Future<bool> removeTodoApp({required String id}) {
    // TODO: implement removeTodoApp
    throw UnimplementedError();
  }

}