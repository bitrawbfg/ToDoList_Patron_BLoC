import 'package:flutter/material.dart';
import 'package:lista_tareas/blocs/bloc_exportaciones.dart';
import 'package:lista_tareas/widgets/lista_tareas.dart';

import 'cajon_tareas.dart';

class Papelera extends StatelessWidget {
  const Papelera({super.key});
  static const id = 'ventana_papelera';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TareasBloc, TareasState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Papelera'),
            actions: [
              IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          drawer: CajonTareas(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text('${state.removedTareas.length} Tareas'),
                ),
              ),
              ListaTareas(listaTareas: state.removedTareas),
            ],
          ),
        );
      },
    );
  }
}
