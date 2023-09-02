import 'package:equatable/equatable.dart';
import 'package:lista_tareas/blocs/bloc_exportaciones.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends HydratedBloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial(valorSwitch: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(
        SwitchState(valorSwitch: true),
      );
    });
    on<SwitchOffEvent>((event, emit) {
      emit(
        const SwitchState(valorSwitch: false),
      );
    });
  }

  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    return SwitchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    return state.toMap();
  }
}
