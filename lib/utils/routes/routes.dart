import 'package:flutter/material.dart';
import 'package:riverpod_hive_todoapp_full_1/utils/routes/routes_name.dart';
import 'package:riverpod_hive_todoapp_full_1/view/home/home_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('Route Bulunamadı')),
          );
        });
    }
  }
}
