import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'todo_app_mode.g.dart';

@HiveType(typeId: 1)
class TodoModel extends HiveObject{
    @HiveField(1)
    final String id;
    @HiveField(2)
    String todonames;
    @HiveField(3)
    bool actives;
    @HiveField(4)
    DateTime createdTime;

    TodoModel({required this.id,required this.todonames,this.actives = false,required this.createdTime});

    factory TodoModel.created({required String todonames,required DateTime createdTime}){
      return TodoModel(id: Uuid().v4(), todonames: todonames, createdTime: createdTime);
    }

    @override
    String toString() {
      return 'TodoModel{id: $id, todonames: $todonames, actives: $actives, createdTime: $createdTime}';
    }

    TodoModel copyWith({
    String? id,
    String? todonames,
    bool? actives,
    DateTime? createdTime,
  }) {
    return TodoModel(
      id: id ?? this.id,
      todonames: todonames ?? this.todonames,
      actives: actives ?? this.actives,
      createdTime: createdTime ?? this.createdTime,
    );
  }

}