part of 'tareas_bloc.dart';

class TareasState extends Equatable {
  final List<Tarea> allTareas;
  final List<Tarea> removedTareas;

  const TareasState({
    this.allTareas = const <Tarea>[],
    this.removedTareas = const <Tarea>[],
  });

  @override
  List<Object> get props => [
        allTareas,
        removedTareas,
      ];

  Map<String, dynamic> toMap() {
    return {
      'allTareas': allTareas.map((e) => e.toMap()).toList(),
      'removedTareas': removedTareas.map((e) => e.toMap()).toList(),
    };
  }

  factory TareasState.fromMap(Map<String, dynamic> map) {
    return TareasState(
      allTareas: List<Tarea>.from(map['allTareas']?.map((e) => Tarea.fromMap(e))),
      removedTareas: List<Tarea>.from(map['removedTareas']?.map((e) => Tarea.fromMap(e))),
    );
  }
}
