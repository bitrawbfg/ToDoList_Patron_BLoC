import 'package:flutter/material.dart';
import 'package:lista_tareas/screens/papelera.dart';
import 'package:lista_tareas/screens/ventana_pestanyas.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Papelera.id:
        return MaterialPageRoute(
          builder: (_) => const Papelera(),
        );

      case VentanaPestanyas.id:
        return MaterialPageRoute(
          builder: (_) => VentanaPestanyas(),
        );
      default:
        return null;
    }
  }
}
