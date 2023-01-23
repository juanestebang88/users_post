import 'package:flutter/material.dart';
import 'package:flutter_application_ceiba/env/environment.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key});
  
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Prueba de Ingreso'),
      backgroundColor: Environment.greenColor,
    );
  }
}