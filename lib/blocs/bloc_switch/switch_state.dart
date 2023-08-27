part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool valorSwitch;
  const SwitchState({
    required this.valorSwitch,
  });

  @override
  List<Object> get props => [];

  Map<String, dynamic> toMap() {
    return {
      'valorSwitch': valorSwitch,
    };
  }

  factory SwitchState.fromMap(Map<String, dynamic> map) {
    return SwitchState(
      valorSwitch: map['valorSwitch'] ?? false,
    );
  }
}

class SwitchInitial extends SwitchState {
  SwitchInitial({required bool valorSwitch}) : super(valorSwitch: false);
}
