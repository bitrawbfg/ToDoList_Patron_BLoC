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
          ),
          drawer: const CajonTareas(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text('${state.tareasEliminadas.length} Tareas'),
                ),
              ),
              ListaTareas(listaTareas: state.tareasEliminadas),
            ],
          ),
        );
      },
    );
  }
}
