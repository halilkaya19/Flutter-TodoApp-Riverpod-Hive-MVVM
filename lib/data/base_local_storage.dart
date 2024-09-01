import 'package:riverpod_hive_todoapp_full_1/model/todo_app_model.dart';

abstract class BaseLocalStorage{
    Future<List<TodoModel>> allList();
    Future<bool> addTodoApp({required TodoModel m});
    Future<bool> removeTodoApp({required String id});
    Future<bool> editTodoApp({required TodoModel m});
}