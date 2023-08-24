# Lista de tareas

Este proyecto consiste en hacer una **lista de tareas** usando el patrón de diseño <abbr title="Business Logic Component">**BLoC**</abbr>.

## Completados

- Añadir tareas desde la ```AppBar``` o desde el ```FloatingActionButton```.
  - Se abre una ventana dónde puedes insertar el nombre de la tarea con 2 botones (```Añadir``` y ```Cancelar```).
- Eliminar tareas manteniendo la tarea pulsada durante un tiempo.
- Marcar tareas como completadas.
- Las tareas se guardan ***permanentemente*** (se usa [```HydratedBloc```](https://pub.dev/packages/hydrated_bloc) y [```PathProvider```](https://pub.dev/packages/path_provider) para almacenar los datos).

## Mejoras
