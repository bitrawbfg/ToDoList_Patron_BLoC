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
      // allTareas: List.from(state.allTareas)..add(event.tarea),
      tareasPendientes: List.from(state.tareasPendientes)..add(event.tarea),
      tareasCompletadas: state.tareasCompletadas,
      tareasFavoritas: state.tareasFavoritas,
      tareasEliminadas: state.tareasEliminadas, // Evita que se borren las tareas de la papelera al añadir una nueva tarea
    ));
  }

  void _onUpdateTarea(UpdateTarea event, Emitter<TareasState> emmit) {
    final state = this.state;
    final tarea = event.tarea;

    List<Tarea> tareasPendientes = state.tareasPendientes;
    List<Tarea> tareasCompletadas = state.tareasCompletadas;
    List<Tarea> tareasFavoritas = state.tareasFavoritas;
    tarea.isFinalizada == false
        ? {
            tareasPendientes = List.from(tareasPendientes)..remove(tarea),
            tareasCompletadas = List.from(tareasCompletadas)..insert(0, tarea.copyWith(isFinalizada: true)),
          }
        : {
            tareasCompletadas = List.from(tareasCompletadas)..remove(tarea),
            tareasPendientes = List.from(tareasPendientes)..insert(0, tarea.copyWith(isFinalizada: false)),
          };

    // ignore: invalid_use_of_visible_for_testing_member
    emit(TareasState(
      tareasCompletadas: tareasCompletadas,
      tareasPendientes: tareasPendientes,
      tareasFavoritas: tareasFavoritas,
      tareasEliminadas: state.tareasEliminadas,
    ));
  }

  void _onRemoveTarea(RemoveTarea event, Emitter<TareasState> emmit) {
    final state = this.state;

    // ignore: invalid_use_of_visible_for_testing_member
    emit(TareasState(
      // allTareas: List.from(state.allTareas)..remove(event.tarea),
      tareasCompletadas: List.from(state.tareasCompletadas)..remove(event.tarea),
      tareasFavoritas: List.from(state.tareasFavoritas)..remove(event.tarea),
      tareasPendientes: List.from(state.tareasPendientes)..remove(event.tarea),
      tareasEliminadas: List.from(state.tareasEliminadas)..add(event.tarea),
    ));
  }

  void _onDeleteTarea(DeleteTarea event, Emitter<TareasState> emmit) {
    final state = this.state;

    // ignore: invalid_use_of_visible_for_testing_member
    emit(TareasState(
      // allTareas: state.allTareas,
      tareasPendientes: state.tareasPendientes,
      tareasCompletadas: state.tareasCompletadas,
      tareasFavoritas: state.tareasFavoritas,
      tareasEliminadas: List.from(state.tareasEliminadas)..remove(event.tarea),
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
