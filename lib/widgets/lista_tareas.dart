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
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: listaTareas
              .map((tarea) => ExpansionPanelRadio(
                    value: tarea.id,
                    headerBuilder: (context, isAbierta) => TileTarea(tarea: tarea),
                    body: ListTile(
                      title: SelectableText.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Text\n',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: tarea.titulo),
                            const TextSpan(
                              text: '\n\nDescripción\n',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: tarea.descripcion)
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

/*
Expanded(
  child: ListView.builder(
    itemCount: listaTareas.length,
    itemBuilder: ((context, index) {
      var tarea = listaTareas[index];

      return TileTarea(tarea: tarea);
    }),
  ),
);
*/