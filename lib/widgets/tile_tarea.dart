import 'package:flutter/material.dart';
import 'package:lista_tareas/blocs/bloc_exportaciones.dart';
import 'package:lista_tareas/models/tarea.dart';

class TileTarea extends StatelessWidget {
  const TileTarea({
    Key? key,
    required this.tarea,
  }) : super(key: key);

  final Tarea tarea;

  void _removeOrDeleteTarea(BuildContext context, Tarea tarea) {
    tarea.isEliminada! ? context.read<TareasBloc>().add(DeleteTarea(tarea: tarea)) : context.read<TareasBloc>().add(RemoveTarea(tarea: tarea));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        tarea.titulo,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration: tarea.isFinalizada! ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: tarea.isFinalizada,
        onChanged: tarea.isEliminada == false
            ? ((value) {
                context.read<TareasBloc>().add(UpdateTarea(tarea: tarea));
              })
            : null,
      ),
      onLongPress: () => _removeOrDeleteTarea(context, tarea),
    );
  }
}
