import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_hive_todoapp_full_1/model/todo_app_model.dart';
import 'package:riverpod_hive_todoapp_full_1/res/app_theme.dart';
import 'package:riverpod_hive_todoapp_full_1/utils/routes/routes.dart';
import 'package:riverpod_hive_todoapp_full_1/utils/routes/routes_name.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter("uygulama");
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>("todobox");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mvc Riverpod Hive TodoApp',
      themeMode: ThemeMode.dark,
      theme: AppTheme().appTheme(),
      initialRoute: RoutesName.home,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
