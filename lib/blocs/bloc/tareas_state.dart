part of 'tareas_bloc.dart';

class TareasState extends Equatable {
  final List<Tarea> allTareas;

  const TareasState({
    this.allTareas = const <Tarea>[],
  });

  @override
  List<Object> get props => [allTareas];

  Map<String, dynamic> toMap() {
    return {
      'allTareas': allTareas.map((e) => e.toMap()).toList(),
    };
  }

  factory TareasState.fromMap(Map<String, dynamic> map) {
    return TareasState(
      allTareas: List<Tarea>.from(map['allTareas']?.map((e) => Tarea.fromMap(e))),
    );
  }
}
