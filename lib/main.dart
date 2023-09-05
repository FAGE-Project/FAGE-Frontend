import 'package:fage_telas/components/theme-data/dark_theme.dart';
import 'package:fage_telas/components/theme-data/light_theme.dart';
import 'package:fage_telas/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routes.home,
      theme: LightThemeData().themeData,
      darkTheme: DarkThemeData().themeData,
      routes: Routes.list,
    );
  }
}
