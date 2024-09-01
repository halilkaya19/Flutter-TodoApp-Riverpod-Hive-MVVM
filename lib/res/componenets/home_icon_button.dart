import 'package:flutter/material.dart';

class HomeIconButtonWidget extends StatelessWidget {
  final VoidCallback btn;
  final IconData icon;

  const HomeIconButtonWidget({required this.btn,required this.icon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: btn, icon: Icon(icon));
  }
}
