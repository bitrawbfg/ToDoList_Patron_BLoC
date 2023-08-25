import 'package:flutter/material.dart';
import 'package:lista_tareas/models/tarea.dart';
import 'package:lista_tareas/widgets/tile_tarea.dart';

class ListaTareas extends StatelessWidget {
  const ListaTareas({
    Key? key,
    required this.listaTareas,
  }) : super(key: key);

  final List<Tarea> listaTareas;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: listaTareas.length,
        itemBuilder: ((context, index) {
          var tarea = listaTareas[index];

          return TileTarea(tarea: tarea);
        }),
      ),
    );
  }
}
