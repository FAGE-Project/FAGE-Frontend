import 'package:fage/pages/home.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    "/home": (_) => const Home(),
  };

  static const String home = "/home";

}
