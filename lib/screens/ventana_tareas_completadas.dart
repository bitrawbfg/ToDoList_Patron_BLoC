import 'package:flutter/material.dart';
import 'package:lista_tareas/blocs/bloc_exportaciones.dart';
import 'package:lista_tareas/models/tarea.dart';
import 'package:lista_tareas/widgets/lista_tareas.dart';

class VentanaTareasCompletadas extends StatelessWidget {
  const VentanaTareasCompletadas({Key? key}) : super(key: key);
  static const id = 'ventana_tareas';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TareasBloc, TareasState>(
      builder: (context, state) {
        List<Tarea> listaTareas = state.tareasCompletadas;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${listaTareas.length} Tareas',
                ),
              ),
            ),
            ListaTareas(listaTareas: listaTareas),
          ],
        );
      },
    );
  }
}
