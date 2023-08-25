import 'package:flutter/material.dart';
import 'package:lista_tareas/screens/papelera.dart';
import 'package:lista_tareas/screens/ventana_tareas.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Papelera.id:
        return MaterialPageRoute(
          builder: (_) => Papelera(),
        );

      case VentanaTareas.id:
        return MaterialPageRoute(
          builder: (_) => VentanaTareas(),
        );
      default:
        return null;
    }
  }
}
