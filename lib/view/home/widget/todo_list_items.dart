import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_hive_todoapp_full_1/model/todo_app_model.dart';
import 'package:riverpod_hive_todoapp_full_1/view_model/local_data_view_model.dart';

class TodoListItems extends ConsumerStatefulWidget {
  final TodoModel todos;

  const TodoListItems({required this.todos, Key? key}) : super(key: key);

  @override
  ConsumerState<TodoListItems> createState() => _TodoListItemsState();
}

class _TodoListItemsState extends ConsumerState<TodoListItems> {
  late TextEditingController _todonames;

  @override
  void initState() {
    super.initState();
    _todonames = TextEditingController(text: widget.todos.todonames);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.6),
              blurRadius: 5,
              spreadRadius: 1,
              blurStyle: BlurStyle.outer),
        ],
        color: Colors.white70.withOpacity(0.5),
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            widget.todos.actives = !widget.todos.actives;
            ref
                .read(LocalStorageManagerProvider.notifier)
                .editTodo(m: widget.todos);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.check,
                color: widget.todos.actives ? Colors.green : Colors.transparent),
          ),
        ),
        title: widget.todos.actives
            ? Text(widget.todos.todonames)
            : TextField(
                decoration: InputDecoration(border: InputBorder.none),
                controller: _todonames,
                onSubmitted: (value) {
                  widget.todos.todonames = value;ref.read(LocalStorageManagerProvider.notifier).editTodo(m: widget.todos);
                },
              ),
      ),
    );
  }
}
