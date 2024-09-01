import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_hive_todoapp_full_1/data/base_local_storage.dart';
import 'package:riverpod_hive_todoapp_full_1/data/hive_local_storage.dart';
import 'package:riverpod_hive_todoapp_full_1/model/todo_app_model.dart';
import 'local_state.dart';

final localStorageProvider = Provider<BaseLocalStorage>((ref) => HiveLocalStorage());
final LocalStorageManagerProvider = StateNotifierProvider<LocalStorageManager,LocalState>((ref) => LocalStorageManager(ref));

class LocalStorageManager extends StateNotifier<LocalState>{

  BaseLocalStorage db;
  LocalStorageManager(Ref ref) : this.db = ref.watch(localStorageProvider) , super(LocalInitials()){
    allList();
  }

  allList() async{
    state = Localloading();
    try {
      await Future.delayed(const Duration(seconds:1));
      await db.allList().then((value){
        if (value!.isEmpty) {
          state = LocalEmty();
        } else {
          state = Localload(value);
        }
      }).catchError((e){
        print("Hata $e");
        state = LocalError(e);
      });
    } catch (e) {
      print("Hata");
      state = LocalError(throw Exception());
    }
  }

  addData({required TodoModel m}) async{
    state = Localloading();
    try{
      await Future.delayed(const Duration(seconds:1));
      await db.addTodoApp(m: m).then((value) {
          if(value){
            db.allList().then((value) {
              state = Localload(value);
            });
          }else{
            state = LocalError(throw Exception());
          }
      });
    }catch(e){
      print("Hata");
      state = LocalError(throw Exception());
    }
  }

  deleteTodo({required String id}) async{
    state = Localloading();
    try{
      await Future.delayed(const Duration(seconds:1));
      await db.removeTodoApp(id: id).then((value) {
        if(value){
          db.allList().then((value) {
            if(value!.isEmpty){
              state = LocalEmty();
            }else{
              state = Localload(value);
            }
          });
        }else{
          state = LocalError(throw Exception());
        }
      });
    }catch(e){
      state = LocalError(throw Exception());
    }
  }

  editTodo({required TodoModel m}) async{
    state = Localloading();
    try{
      await db.editTodoApp(m: m).then((value) {
        if(value){
          db.allList().then((value) {
            state = Localload(value);
          });
        }else{
          state = LocalError(throw Exception());
        }
      });
    }catch(e){
      state = LocalError(throw Exception());
    }
  }


}