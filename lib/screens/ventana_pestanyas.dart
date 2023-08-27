import 'package:flutter/material.dart';
import 'package:lista_tareas/screens/cajon_tareas.dart';
import 'package:lista_tareas/screens/ventana_add_tarea.dart';
import 'package:lista_tareas/screens/ventana_tareas_completadas.dart';
import 'package:lista_tareas/screens/ventana_tareas_favoritas.dart';
import 'package:lista_tareas/screens/ventana_tareas_pendientes.dart';

class VentanaPestanyas extends StatefulWidget {
  static const id = 'ventana_pestanyas';

  VentanaPestanyas({super.key});

  @override
  State<VentanaPestanyas> createState() => _VentanaPestanyasState();
}

class _VentanaPestanyasState extends State<VentanaPestanyas> {
  final List<Map<String, dynamic>> _detallesPagina = [
    {
      'nombrePagina': const VentanaTareasPendientes(),
      'titulo': 'Tareas Pendientes',
    },
    {
      'nombrePagina': const VentanaTareasCompletadas(),
      'titulo': 'Tareas Completadas',
    },
    {
      'nombrePagina': const VentanaTareasFavoritas(),
      'titulo': 'Tareas Favoritas',
    },
  ];

  var _paginaSeleccionadaIndex = 0;

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
    return Scaffold(
      appBar: AppBar(
        title: Text(_detallesPagina[_paginaSeleccionadaIndex]['titulo']),
        actions: [
          IconButton(
            onPressed: () => _addTarea(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const CajonTareas(),
      body: _detallesPagina[_paginaSeleccionadaIndex]['nombrePagina'],
      floatingActionButton: _paginaSeleccionadaIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addTarea(context),
              tooltip: 'Añadir tarea',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaSeleccionadaIndex,
        onTap: ((index) {
          setState(() {
            _paginaSeleccionadaIndex = index;
          });
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle_sharp),
            label: 'Tareas Pendientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Tareas Completadas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Tareas Favoritas',
          ),
        ],
      ),
    );
  }
}
