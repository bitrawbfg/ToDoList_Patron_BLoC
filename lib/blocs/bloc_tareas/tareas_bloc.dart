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
    on<MarkUnmarkFavoriteTarea>(_onMarkUnmarkFavoriteTarea);
    on<EditTarea>(_onEditTarea);
    on<RestoreTarea>(_onRestoreTarea);
    on<DeleteAllTareas>(_onDeleteAllTareas);
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

    /*tarea.isFinalizada == false
        ? {
            if (tarea.isFavorita == false)
              {
                tareasPendientes = List.from(tareasPendientes)..remove(tarea),
                // tareasCompletadas = List.from(tareasCompletadas)..insert(0, tarea.copyWith(isFinalizada: true)),
                tareasCompletadas.insert(0, tarea.copyWith(isFinalizada: true))
              }
          }
        : {
            tareasCompletadas = List.from(tareasCompletadas)..remove(tarea),
            tareasPendientes = List.from(tareasPendientes)..insert(0, tarea.copyWith(isFinalizada: false)),
          };*/

    if (tarea.isFinalizada == false) {
      if (tarea.isFavorita == false) {
        tareasPendientes = List.from(tareasPendientes)..remove(tarea);
        tareasCompletadas.insert(0, tarea.copyWith(isFinalizada: true));
      } else {
        var indexTarea = tareasFavoritas.indexOf(tarea);

        tareasPendientes = List.from(tareasPendientes)..remove(tarea);
        tareasCompletadas.insert(0, tarea.copyWith(isFinalizada: true));
        tareasFavoritas = List.from(tareasFavoritas)
          ..remove(tarea)
          ..insert(indexTarea, tarea.copyWith(isFinalizada: true));
      }
    } else {
      if (tarea.isFavorita == false) {
        tareasCompletadas = List.from(tareasCompletadas)..remove(tarea);
        tareasPendientes = List.from(tareasPendientes)..insert(0, tarea.copyWith(isFinalizada: false));
      } else {
        var indexTarea = tareasFavoritas.indexOf(tarea);

        tareasCompletadas = List.from(tareasCompletadas)..remove(tarea);
        tareasPendientes = List.from(tareasPendientes)..insert(0, tarea.copyWith(isFinalizada: false));
        tareasFavoritas = List.from(tareasFavoritas)
          ..remove(tarea)
          ..insert(indexTarea, tarea.copyWith(isFinalizada: false));
      }
    }

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
      tareasEliminadas: List.from(state.tareasEliminadas)..add(event.tarea.copyWith(isEliminada: true)),
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

  void _onMarkUnmarkFavoriteTarea(MarkUnmarkFavoriteTarea event, Emitter<TareasState> emmit) {
    final state = this.state;

    List<Tarea> tareasPendientes = state.tareasPendientes;
    List<Tarea> tareasCompletadas = state.tareasCompletadas;
    List<Tarea> tareasFavoritas = state.tareasFavoritas;

    if (event.tarea.isFinalizada == false) {
      if (event.tarea.isFavorita == false) {
        var indexTarea = tareasPendientes.indexOf(event.tarea);

        tareasPendientes = List.from(tareasPendientes)
          ..remove(event.tarea)
          ..insert(indexTarea, event.tarea.copyWith(isFavorita: true));

        tareasFavoritas.insert(0, event.tarea.copyWith(isFavorita: true));
      } else {
        var indexTarea = tareasPendientes.indexOf(event.tarea);

        tareasPendientes = List.from(tareasPendientes)
          ..remove(event.tarea)
          ..insert(indexTarea, event.tarea.copyWith(isFavorita: false));

        tareasFavoritas.remove(event.tarea);
      }
    } else {
      if (event.tarea.isFavorita == false) {
        var indexTarea = tareasCompletadas.indexOf(event.tarea);

        tareasCompletadas = List.from(tareasCompletadas)
          ..remove(event.tarea)
          ..insert(indexTarea, event.tarea.copyWith(isFavorita: true));

        tareasFavoritas.insert(0, event.tarea.copyWith(isFavorita: true));
      } else {
        var indexTarea = tareasCompletadas.indexOf(event.tarea);

        tareasCompletadas = List.from(tareasCompletadas)
          ..remove(event.tarea)
          ..insert(indexTarea, event.tarea.copyWith(isFavorita: false));

        tareasFavoritas.remove(event.tarea);
      }
    }

    // ignore: invalid_use_of_visible_for_testing_member
    emit(
      TareasState(
        tareasPendientes: tareasPendientes,
        tareasCompletadas: tareasCompletadas,
        tareasFavoritas: tareasFavoritas,
        tareasEliminadas: state.tareasEliminadas,
      ),
    );
  }

  void _onEditTarea(EditTarea event, Emitter<TareasState> emit) {
    final state = this.state;
    List<Tarea> tareasFavoritas = state.tareasFavoritas;

    if (event.tareaAntigua.isFavorita == true) {
      tareasFavoritas
        ..remove(event.tareaAntigua)
        ..insert(0, event.tareaNueva);
    }

    emit(
      TareasState(
        tareasPendientes: List.from(state.tareasPendientes)
          ..remove(event.tareaAntigua)
          ..insert(0, event.tareaNueva),
        tareasCompletadas: state.tareasCompletadas..remove(event.tareaAntigua),
        tareasFavoritas: tareasFavoritas,
        tareasEliminadas: state.tareasEliminadas,
      ),
    );
  }

  void _onRestoreTarea(RestoreTarea event, Emitter<TareasState> emit) {
    final state = this.state;

    emit(
      TareasState(
        tareasEliminadas: List.from(state.tareasEliminadas)..remove(event.tarea),
        tareasPendientes: List.from(state.tareasPendientes)
          ..insert(
            0,
            event.tarea.copyWith(
              isEliminada: false,
              isFinalizada: false,
              isFavorita: false,
            ),
          ),
        tareasCompletadas: state.tareasCompletadas,
        tareasFavoritas: state.tareasFavoritas,
      ),
    );
  }

  void _onDeleteAllTareas(DeleteAllTareas event, Emitter<TareasState> emit) {
    final state = this.state;

    emit(
      TareasState(
        tareasEliminadas: List.from(state.tareasEliminadas)..clear(),
        tareasPendientes: state.tareasPendientes,
        tareasCompletadas: state.tareasCompletadas,
        tareasFavoritas: state.tareasFavoritas,
      ),
    );
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
