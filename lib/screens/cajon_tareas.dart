import 'package:flutter/material.dart';
import 'package:lista_tareas/blocs/bloc_exportaciones.dart';
import 'package:lista_tareas/screens/papelera.dart';
import 'package:lista_tareas/screens/ventana_tareas.dart';

class CajonTareas extends StatelessWidget {
  const CajonTareas({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 20,
              ),
              color: Colors.grey,
              child: Text(
                'Cajón de Tareas',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<TareasBloc, TareasState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed(VentanaTareas.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text('Mis Tareas'),
                    trailing: Text('${state.allTareas.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TareasBloc, TareasState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed(Papelera.id),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Papelera'),
                    trailing: Text('${state.removedTareas.length}'),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                  value: state.valorSwitch,
                  onChanged: (newValue) {
                    newValue ? context.read<SwitchBloc>().add(SwitchOnEvent()) : context.read<SwitchBloc>().add(SwitchOffEvent());
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
