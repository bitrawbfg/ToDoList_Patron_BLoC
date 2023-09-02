import 'package:flutter/material.dart';
import 'package:lista_tareas/screens/ventana_pestanyas.dart';
import 'package:lista_tareas/services/app_router.dart';
import 'package:lista_tareas/services/app_theme.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/bloc_exportaciones.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TareasBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Lista de tareas',
            theme: state.valorSwitch ? AppThemes.appThemeData[AppTheme.darkTheme] : AppThemes.appThemeData[AppTheme.lightTheme],
            home: VentanaPestanyas(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
