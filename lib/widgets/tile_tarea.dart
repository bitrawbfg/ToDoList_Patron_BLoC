import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lista_tareas/blocs/bloc_exportaciones.dart';
import 'package:lista_tareas/models/tarea.dart';
import 'package:lista_tareas/screens/ventana_edit_tarea.dart';
import 'package:lista_tareas/widgets/popup_menu.dart';

class TileTarea extends StatelessWidget {
  const TileTarea({
    Key? key,
    required this.tarea,
  }) : super(key: key);

  final Tarea tarea;

  void _removeOrDeleteTarea(BuildContext context, Tarea tarea) {
    tarea.isEliminada! ? context.read<TareasBloc>().add(DeleteTarea(tarea: tarea)) : context.read<TareasBloc>().add(RemoveTarea(tarea: tarea));
  }

  void _editTarea(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: VentanaEditTarea(
          tareaAntigua: tarea,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                tarea.isFavorita == false
                    ? const Icon(Icons.star_outline)
                    : const Icon(
                        Icons.star,
                      ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tarea.titulo,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        decoration: tarea.isFinalizada! ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    Text(DateFormat('dd/MMM/yyyy hh:mm').format(DateTime.parse(tarea.fecha))),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: tarea.isFinalizada,
                onChanged: tarea.isEliminada == false
                    ? ((value) {
                        context.read<TareasBloc>().add(UpdateTarea(tarea: tarea));
                      })
                    : null,
              ),
              PopupMenu(
                tarea: tarea,
                cancelOrDeleteCallback: () => _removeOrDeleteTarea(context, tarea),
                likeOrDislikeCallback: () => context.read<TareasBloc>().add(MarkUnmarkFavoriteTarea(tarea: tarea)),
                editTareaCallback: () {
                  _editTarea(context);
                  Navigator.of(context).pop();
                },
                restoreTareaCallback: () => context.read<TareasBloc>().add(RestoreTarea(tarea: tarea)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
