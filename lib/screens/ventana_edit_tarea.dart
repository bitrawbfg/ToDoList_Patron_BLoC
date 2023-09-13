import 'package:flutter/material.dart';
import 'package:lista_tareas/blocs/bloc_exportaciones.dart';

import '../models/tarea.dart';

class VentanaEditTarea extends StatelessWidget {
  final Tarea tareaAntigua;

  const VentanaEditTarea({
    Key? key,
    required this.tareaAntigua,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controladorTitulo = TextEditingController(
      text: tareaAntigua.titulo,
    );
    TextEditingController controladorDescripcion = TextEditingController(
      text: tareaAntigua.descripcion,
    );

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
              'Edita la tarea',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: TextField(
                autofocus: true,
                controller: controladorTitulo,
                decoration: const InputDecoration(
                  label: Text('Título'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextField(
              autofocus: true,
              controller: controladorDescripcion,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                label: Text('Descripción'),
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
                    var tareaEditada = Tarea(
                      id: tareaAntigua.id,
                      titulo: controladorTitulo.text,
                      descripcion: controladorDescripcion.text,
                      isFavorita: tareaAntigua.isFavorita,
                      isFinalizada: false,
                      fecha: DateTime.now().toString(),
                    );

                    context.read<TareasBloc>().add(EditTarea(
                          tareaAntigua: tareaAntigua,
                          tareaNueva: tareaEditada,
                        ));
                    Navigator.pop(context);
                  },
                  child: const Text('Guardar cambios'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
