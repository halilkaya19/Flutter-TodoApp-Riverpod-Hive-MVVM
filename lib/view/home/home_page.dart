import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_hive_todoapp_full_1/model/todo_app_model.dart';
import 'package:riverpod_hive_todoapp_full_1/res/componenets/home_icon_button.dart';
import 'package:riverpod_hive_todoapp_full_1/res/constant/string_constant.dart';
import 'package:riverpod_hive_todoapp_full_1/res/style/text_style.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:riverpod_hive_todoapp_full_1/view/home/widget/todo_lists.dart';
import 'package:riverpod_hive_todoapp_full_1/view_model/local_data_view_model.dart';
import 'package:riverpod_hive_todoapp_full_1/view_model/local_state.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.instance.appBarTitle,
          style: AppStyle.instance.appbarStyle,
        ),
        actions: [
          HomeIconButtonWidget(btn: () {}, icon: Icons.search),
          HomeIconButtonWidget(btn: () => _buildTodoAppOpen(context,ref), icon: Icons.add),
        ],
      ),
      body: const _Content(),
    );
  }
  _buildTodoAppOpen(BuildContext context,WidgetRef ref) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ListTile(
            title: TextField(
              onSubmitted: (value) {
                Navigator.of(context).pop();
                DatePicker.showTimePicker(context,onConfirm: (time) {
                   var eklenecekData = TodoModel.created(todonames: value, createdTime: time);
                   ref.read(LocalStorageManagerProvider.notifier).addData(m: eklenecekData);
                }, showSecondsColumn:false);
              },
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: AppString.instance.todoAppInputHintText),
            ),
          ),
        );
      },
    );
  }
}

class _Content extends ConsumerWidget {
  const _Content({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final  stateStatus = ref.watch(LocalStorageManagerProvider);
    print("Yüklenen State / $stateStatus");
    if(stateStatus is Localloading){
      return const Center(child: CircularProgressIndicator(),);
    }else if(stateStatus is LocalError){
      return Center(child: Text(stateStatus.e.toString()),);
    }else if(stateStatus is Localload){
      return TodoList(todolist: stateStatus.lists);
    }else if(stateStatus is LocalEmty){
      return Center(child: Text("Liste Boş"),);
    }else{
      return const Center(child: Text("N/A"),);
    }
  }
}


