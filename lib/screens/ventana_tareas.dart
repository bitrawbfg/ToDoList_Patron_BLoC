import 'package:flutter/material.dart';
import 'package:lista_tareas/blocs/bloc_exportaciones.dart';
import 'package:lista_tareas/models/tarea.dart';
import 'package:lista_tareas/screens/cajon_tareas.dart';
import 'package:lista_tareas/screens/ventana_add_tarea.dart';
import 'package:lista_tareas/widgets/lista_tareas.dart';

class VentanaTareas extends StatefulWidget {
  const VentanaTareas({Key? key}) : super(key: key);
  static const id = 'ventana_tareas';

  @override
  State<VentanaTareas> createState() => _VentanaTareasState();
}

class _VentanaTareasState extends State<VentanaTareas> {
  void _addTarea(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const SingleChildScrollView(
        child: VentanaAddTarea(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TareasBloc, TareasState>(
      builder: (context, state) {
        List<Tarea> listaTareas = state.allTareas;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de tareas'),
            actions: [
              IconButton(
                onPressed: () => _addTarea(context),
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
                  label: Text(
                    '${state.allTareas.length} Tareas',
                  ),
                ),
              ),
              ListaTareas(listaTareas: listaTareas),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTarea(context),
            tooltip: 'Añadir tarea',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
