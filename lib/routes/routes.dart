import 'package:fage/pages/home.dart';
import 'package:fage/pages/register_corp.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    "/home": (_) => const Home(),
    "/register_corp": (_) => const CadastroCorp(),
  };

  static const String home = "/home";

  static const String cadastroCorp = "/register_corp";

}
