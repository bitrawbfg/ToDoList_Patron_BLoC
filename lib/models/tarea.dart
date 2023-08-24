import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Tarea extends Equatable {
  final String id;
  final String titulo;
  bool? isFinalizada;
  bool? isEliminada;

  Tarea({
    required this.id,
    required this.titulo,
    this.isFinalizada,
    this.isEliminada,
  }) {
    /*Esto permite inicializar los valores*/
    isFinalizada = isFinalizada ?? false;
    isEliminada = isEliminada ?? false;
  }

  Tarea copyWith({
    String? id,
    String? titulo,
    bool? isFinalizada,
    bool? isEliminada,
  }) {
    return Tarea(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      isFinalizada: isFinalizada ?? this.isFinalizada,
      isEliminada: isEliminada ?? this.isEliminada,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'isFinalizada': isFinalizada,
      'isEliminada': isEliminada,
    };
  }

  factory Tarea.fromMap(Map<String, dynamic> map) {
    return Tarea(
      id: map['id'] ?? '',
      titulo: map['titulo'] ?? '',
      isFinalizada: map['isFinalizada'],
      isEliminada: map['isEliminada'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        titulo,
        isFinalizada,
        isEliminada,
      ];
}
