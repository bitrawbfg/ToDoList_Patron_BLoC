# Lista de tareas

Este proyecto consiste en hacer una **lista de tareas** usando el patrón de diseño <abbr title="Business Logic Component">**BLoC**</abbr>.

## Completados

- Añadir tareas desde la ```AppBar``` o desde el ```FloatingActionButton```.
  - Se abre una ventana dónde puedes insertar el nombre de la tarea con 2 botones (```Añadir``` y ```Cancelar```).
- Eliminar tareas manteniendo la tarea pulsada durante un tiempo.
- Marcar tareas como completadas.
- Las tareas se guardan ***permanentemente*** (se usa [```HydratedBloc```](https://pub.dev/packages/hydrated_bloc) y [```PathProvider```](https://pub.dev/packages/path_provider) para almacenar los datos).

  ---

- Añadir **Papelera de Tareas**
  - Al eliminar las tareas de la lista se mueven a la *papelera*.
  - Las tareas **no se pueden modificar** desde aquí.
- Añadir **menú lateral** con la *lista de tareas* y *papelera*, ambos con contadores.

  ---

- Añadir temas **claro** y **oscuro**.

  ---

- Añadir ```BottomNavigationBar``` con las siguientes 'ventanas':
  - Tareas Pendientes.
  - Tareas Completadas.
  - Tareas Favoritas.

- Añadir listas de tareas pendientes, completadas y favoritas.

  ---

- Añadir campo ```Descripción``` a las tareas.
- Modificar aspecto de las tareas.
  - Al pulsar sobre la flecha de la tarea aparece la descripción de dicha tarea.

---

## Mejoras

---

## Bugs

## Bugs Solucionados

- [[ca137f53]](https://github.com/bitrawbfg/ToDoList_Patron_BLoC/commit/ca137f53cca14edc22efd12d7c61a8fd8e421dd4) Cuando se intenta eliminar una tarea de la papelera se duplica.
  - El ```ExpansionPanel``` **no permite elementos duplicados** con lo cuál deja de mostrar la lista de las tareas eliminadas (Papelera).
