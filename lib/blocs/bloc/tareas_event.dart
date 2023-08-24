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

class DeleteTarea extends TareasEvent {
  final Tarea tarea;

  const DeleteTarea({
    required this.tarea,
  });

  @override
  List<Object> get props => [tarea];
}
