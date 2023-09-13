import 'package:flutter/material.dart';
import 'package:lista_tareas/models/tarea.dart';

class PopupMenu extends StatelessWidget {
  final Tarea tarea;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback editTareaCallback;
  final VoidCallback restoreTareaCallback;

  const PopupMenu({
    Key? key,
    required this.tarea,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislikeCallback,
    required this.editTareaCallback,
    required this.restoreTareaCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: tarea.isEliminada == false
          ? (context) => [
                PopupMenuItem(
                  onTap: editTareaCallback,
                  child: TextButton.icon(
                    onPressed: editTareaCallback,
                    icon: const Icon(Icons.edit),
                    label: const Text('Editar'),
                  ),
                ),
                PopupMenuItem(
                  onTap: likeOrDislikeCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: tarea.isFavorita == false
                        ? const Icon(Icons.bookmark_add_outlined)
                        : const Icon(
                            Icons.bookmark_remove,
                          ),
                    label: tarea.isFavorita == false
                        ? const Text('Añadir a Bookmarks')
                        : const Text(
                            'Eliminar de Bookmarks',
                          ),
                  ),
                ),
                PopupMenuItem(
                  onTap: cancelOrDeleteCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete),
                    label: const Text('Eliminar'),
                  ),
                ),
              ]
          : (context) => [
                PopupMenuItem(
                  onTap: restoreTareaCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.restore),
                    label: const Text('Restaurar'),
                  ),
                ),
                PopupMenuItem(
                  onTap: cancelOrDeleteCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete_forever),
                    label: const Text('Eliminar completamente'),
                  ),
                ),
              ],
    );
  }
}
