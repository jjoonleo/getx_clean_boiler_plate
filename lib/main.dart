import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx_clean_boiler_plate/routes/router.dart';

void main() {
  runApp(
    ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "clean architecture",
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        theme: ThemeData(colorScheme: lightColorScheme),
        darkTheme: ThemeData(colorScheme: darkColorScheme),
        themeMode: ThemeMode.system,
      );
    });
  }
}
