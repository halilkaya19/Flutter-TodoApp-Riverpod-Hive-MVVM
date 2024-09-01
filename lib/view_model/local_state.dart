import 'package:riverpod_hive_todoapp_full_1/model/todo_app_model.dart';

abstract class LocalState{
    LocalState();
}

class LocalInitials extends LocalState{
    LocalInitials();
}

class Localloading extends LocalState{
      Localloading();
}

class LocalError extends LocalState{
      Error e;
      LocalError(this.e);
}

class Localload extends LocalState{
      late List<TodoModel?> lists;
      Localload(this.lists);
}

class LocalEmty extends LocalState{
      LocalEmty();
}