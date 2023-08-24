import 'package:flutter/material.dart';
import 'package:lista_tareas/blocs/bloc_exportaciones.dart';
import 'package:lista_tareas/models/tarea.dart';

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

          return ListTile(
            title: Text(tarea.titulo),
            trailing: Checkbox(
              value: tarea.isFinalizada,
              onChanged: ((value) {
                context.read<TareasBloc>().add(UpdateTarea(tarea: tarea));
              }),
            ),
            onLongPress: () => context.read<TareasBloc>().add(DeleteTarea(tarea: tarea)),
          );
        }),
      ),
    );
  }
}
