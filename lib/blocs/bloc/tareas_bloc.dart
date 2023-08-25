import 'package:equatable/equatable.dart';
import 'package:lista_tareas/blocs/bloc_exportaciones.dart';
import 'package:lista_tareas/models/tarea.dart';

part 'tareas_event.dart';
part 'tareas_state.dart';

class TareasBloc extends HydratedBloc<TareasEvent, TareasState> {
  TareasBloc() : super(const TareasState()) {
    on<AddTarea>(_onAddTarea);
    on<UpdateTarea>(_onUpdateTarea);
    on<DeleteTarea>(_onDeleteTarea);
    on<RemoveTarea>(_onRemoveTarea);
  }

  void _onAddTarea(AddTarea event, Emitter<TareasState> emmit) {
    final state = this.state;

    // ignore: invalid_use_of_visible_for_testing_member
    emit(TareasState(
      allTareas: List.from(state.allTareas)..add(event.tarea),
      removedTareas: state.removedTareas, // Evita que se borren las tareas de la papelera al añadir una nueva tarea
    ));
  }

  void _onUpdateTarea(UpdateTarea event, Emitter<TareasState> emmit) {
    final state = this.state;
    final tarea = event.tarea;
    final int index = state.allTareas.indexOf(tarea);

    List<Tarea> allTareas = List.from(state.allTareas)..remove(tarea);
    tarea.isFinalizada == false ? allTareas.insert(index, tarea.copyWith(isFinalizada: true)) : allTareas.insert(index, tarea.copyWith(isFinalizada: false));

    // ignore: invalid_use_of_visible_for_testing_member
    emit(TareasState(
      allTareas: allTareas,
      removedTareas: state.removedTareas,
    ));
  }

  void _onRemoveTarea(RemoveTarea event, Emitter<TareasState> emmit) {
    final state = this.state;

    // ignore: invalid_use_of_visible_for_testing_member
    emit(TareasState(
      allTareas: List.from(state.allTareas)..remove(event.tarea),
      removedTareas: List.from(state.removedTareas)..add(event.tarea.copyWith(isEliminada: true)),
    ));
  }

  void _onDeleteTarea(DeleteTarea event, Emitter<TareasState> emmit) {
    final state = this.state;

    // ignore: invalid_use_of_visible_for_testing_member
    emit(TareasState(
      allTareas: state.allTareas,
      removedTareas: List.from(state.removedTareas)..remove(event.tarea),
    ));
  }

  @override
  TareasState? fromJson(Map<String, dynamic> json) {
    return TareasState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TareasState state) {
    return state.toMap();
  }
}
