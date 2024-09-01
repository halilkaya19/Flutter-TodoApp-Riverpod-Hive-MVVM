import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_hive_todoapp_full_1/model/todo_app_model.dart';
import 'package:riverpod_hive_todoapp_full_1/view/home/widget/todo_list_items.dart';
import 'package:riverpod_hive_todoapp_full_1/view_model/local_data_view_model.dart';

class TodoList extends ConsumerWidget {
  List<TodoModel?> todolist;
  TodoList({required this.todolist,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return ListView.builder(itemBuilder: (context, index) {
      var Oankidata = todolist[index];
      return Dismissible(
        key: ValueKey(todolist[index]!.id),
        onDismissed: (direction) {
          ref.read(LocalStorageManagerProvider.notifier).deleteTodo(id: todolist[index]!.id);
        },
        child: TodoListItems(todos: Oankidata!),
      );
    },itemCount: todolist.length ?? 0,);
  }
}
