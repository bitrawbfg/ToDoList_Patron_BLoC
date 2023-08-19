import 'package:flutter/material.dart';
import 'package:lista_tareas/screens/ventana_tareas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de tareas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VentanaTareas(),
    );
  }
}
