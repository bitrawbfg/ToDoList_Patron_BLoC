part of 'tareas_bloc.dart';

class TareasState extends Equatable {
  // final List<Tarea> allTareas;
  final List<Tarea> tareasPendientes;
  final List<Tarea> tareasCompletadas;
  final List<Tarea> tareasFavoritas;
  final List<Tarea> tareasEliminadas;

  const TareasState({
    // this.allTareas = const <Tarea>[],
    this.tareasPendientes = const <Tarea>[],
    this.tareasCompletadas = const <Tarea>[],
    this.tareasFavoritas = const <Tarea>[],
    this.tareasEliminadas = const <Tarea>[],
  });

  @override
  List<Object> get props => [
        // allTareas,
        tareasPendientes,
        tareasCompletadas,
        tareasFavoritas,
        tareasEliminadas,
      ];

  Map<String, dynamic> toMap() {
    return {
      // 'allTareas': allTareas.map((e) => e.toMap()).toList(),
      'tareasPendientes': tareasPendientes.map((e) => e.toMap()).toList(),
      'tareasCompletadas': tareasCompletadas.map((e) => e.toMap()).toList(),
      'tareasFavoritas': tareasFavoritas.map((e) => e.toMap()).toList(),
      'tareasEliminadas': tareasEliminadas.map((e) => e.toMap()).toList(),
    };
  }

  factory TareasState.fromMap(Map<String, dynamic> map) {
    return TareasState(
      // allTareas: List<Tarea>.from(map['allTareas']?.map((e) => Tarea.fromMap(e))),
      tareasPendientes: List<Tarea>.from(map['tareasPendientes']?.map((e) => Tarea.fromMap(e))),
      tareasCompletadas: List<Tarea>.from(map['tareasCompletadas']?.map((e) => Tarea.fromMap(e))),
      tareasFavoritas: List<Tarea>.from(map['tareasFavoritas']?.map((e) => Tarea.fromMap(e))),
      tareasEliminadas: List<Tarea>.from(map['tareasEliminadas']?.map((e) => Tarea.fromMap(e))),
    );
  }
}
