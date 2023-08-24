import 'package:flutter/material.dart';
import 'package:lista_tareas/screens/ventana_tareas.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/bloc_exportaciones.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TareasBloc(),
      child: MaterialApp(
        title: 'Lista de tareas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const VentanaTareas(),
      ),
    );
  }
}
