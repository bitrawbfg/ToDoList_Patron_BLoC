part of 'tareas_bloc.dart';

abstract class TareasEvent extends Equatable {
  const TareasEvent();

  @override
  List<Object> get props => [];
}

class AddTarea extends TareasEvent {
  final Tarea tarea;

  const AddTarea({
    required this.tarea,
  });

  @override
  List<Object> get props => [tarea];
}

class UpdateTarea extends TareasEvent {
  final Tarea tarea;

  const UpdateTarea({
    required this.tarea,
  });

  @override
  List<Object> get props => [tarea];
}

class RemoveTarea extends TareasEvent {
  final Tarea tarea;

  const RemoveTarea({
    required this.tarea,
  });

  @override
  List<Object> get props => [tarea];
}

class DeleteTarea extends TareasEvent {
  final Tarea tarea;

  const DeleteTarea({
    required this.tarea,
  });

  @override
  List<Object> get props => [tarea];
}

class MarkUnmarkFavoriteTarea extends TareasEvent {
  final Tarea tarea;

  const MarkUnmarkFavoriteTarea({
    required this.tarea,
  });

  @override
  List<Object> get props => [tarea];
}

class EditTarea extends TareasEvent {
  final Tarea tareaAntigua;
  final Tarea tareaNueva;

  const EditTarea({
    required this.tareaAntigua,
    required this.tareaNueva,
  });

  @override
  List<Object> get props => [
        tareaAntigua,
        tareaNueva,
      ];
}

class RestoreTarea extends TareasEvent {
  final Tarea tarea;

  const RestoreTarea({
    required this.tarea,
  });

  @override
  List<Object> get props => [tarea];
}

class DeleteAllTareas extends TareasEvent {}
