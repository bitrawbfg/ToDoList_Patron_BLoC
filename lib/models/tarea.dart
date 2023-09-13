import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Tarea extends Equatable {
  final String id;
  final String titulo;
  final String descripcion;
  final String fecha;
  bool? isFinalizada;
  bool? isEliminada;
  bool? isFavorita;

  Tarea({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.fecha,
    this.isFinalizada,
    this.isEliminada,
    this.isFavorita,
  }) {
    /*Esto permite inicializar los valores*/
    isFinalizada = isFinalizada ?? false;
    isEliminada = isEliminada ?? false;
    isFavorita = isFavorita ?? false;
  }

  Tarea copyWith({
    String? id,
    String? titulo,
    String? descripcion,
    String? fecha,
    bool? isFinalizada,
    bool? isEliminada,
    bool? isFavorita,
  }) {
    return Tarea(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descripcion: descripcion ?? this.descripcion,
      fecha: fecha ?? this.fecha,
      isFinalizada: isFinalizada ?? this.isFinalizada,
      isEliminada: isEliminada ?? this.isEliminada,
      isFavorita: isFavorita ?? this.isFavorita,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descripcion': descripcion,
      'fecha': fecha,
      'isFinalizada': isFinalizada,
      'isEliminada': isEliminada,
      'isFavorita': isFavorita,
    };
  }

  factory Tarea.fromMap(Map<String, dynamic> map) {
    return Tarea(
      id: map['id'] ?? '',
      titulo: map['titulo'] ?? '',
      descripcion: map['descripcion'] ?? '',
      fecha: map['fecha'] ?? '',
      isFinalizada: map['isFinalizada'],
      isEliminada: map['isEliminada'],
      isFavorita: map['isFavorita'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        titulo,
        descripcion,
        fecha,
        isFinalizada,
        isEliminada,
        isFavorita,
      ];
}
