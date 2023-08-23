import 'package:fage/components/theme-data/dark_theme.dart';
import 'package:fage/components/theme-data/light_theme.dart';
import 'package:fage/pages/home.dart';
import 'package:fage/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
