import 'package:flutter/material.dart';
import 'package:lista_tareas/blocs/bloc_exportaciones.dart';
import 'package:lista_tareas/services/guid_gen.dart';

import '../models/tarea.dart';

class VentanaAddTarea extends StatelessWidget {
  const VentanaAddTarea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controladorTitulo = TextEditingController();
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Añade tu tarea',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              autofocus: true,
              controller: controladorTitulo,
              decoration: const InputDecoration(
                label: Text('Título'),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    var tarea = Tarea(
                      id: GUIDGen.generate(),
                      titulo: controladorTitulo.text,
                    );

                    context.read<TareasBloc>().add(AddTarea(tarea: tarea));
                    Navigator.pop(context);
                  },
                  child: const Text('Añadir'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
