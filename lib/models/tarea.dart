import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Tarea extends Equatable {
  final String id;
  final String titulo;
  final String descripcion;
  bool? isFinalizada;
  bool? isEliminada;

  Tarea({
    required this.id,
    required this.titulo,
    required this.descripcion,
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
    String? descripcion,
    bool? isFinalizada,
    bool? isEliminada,
  }) {
    return Tarea(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descripcion: descripcion ?? this.descripcion,
      isFinalizada: isFinalizada ?? this.isFinalizada,
      isEliminada: isEliminada ?? this.isEliminada,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descripcion': descripcion,
      'isFinalizada': isFinalizada,
      'isEliminada': isEliminada,
    };
  }

  factory Tarea.fromMap(Map<String, dynamic> map) {
    return Tarea(
      id: map['id'] ?? '',
      titulo: map['titulo'] ?? '',
      descripcion: map['descripcion'] ?? '',
      isFinalizada: map['isFinalizada'],
      isEliminada: map['isEliminada'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        titulo,
        descripcion,
        isFinalizada,
        isEliminada,
      ];
}
