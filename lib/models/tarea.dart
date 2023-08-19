import 'package:equatable/equatable.dart';

class Tarea extends Equatable {
  final String titulo;
  bool? isFinalizada;
  bool? isEliminada;

  Tarea({
    required this.titulo,
    this.isFinalizada,
    this.isEliminada,
  }) {
    /*Esto permite inicializar los valores*/
    isFinalizada = isFinalizada ?? false;
    isEliminada = isEliminada ?? false;
  }

  Tarea copyWith({
    String? titulo,
    bool? isFinalizada,
    bool? isEliminada,
  }) {
    return Tarea(
      titulo: titulo ?? this.titulo,
      isFinalizada: isFinalizada ?? this.isFinalizada,
      isEliminada: isEliminada ?? this.isEliminada,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'isFinalizada': isFinalizada,
      'isEliminada': isEliminada,
    };
  }

  factory Tarea.fromMap(Map<String, dynamic> map) {
    return Tarea(
      titulo: map['titulo'] ?? '',
      isFinalizada: map['isFinalizada'],
      isEliminada: map['isEliminada'],
    );
  }

  @override
  List<Object?> get props => [
        titulo,
        isFinalizada,
        isEliminada,
      ];
}
