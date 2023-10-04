import 'package:fage/pages/empresa.dart';
import 'package:fage/pages/home.dart';
import 'package:fage/pages/my_fage.dart';
import 'package:fage/pages/register_corp.dart';
import 'package:fage/pages/register_user.dart';
import 'package:fage/pages/agendamento.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    "/home": (_) => const Home(),
    "/register_corp": (_) => const CadastroCorp(),
    "/register_user": (_) => const Cadastro(),
    "/agendamento": (_) => Agendamento(),
    "/empresa": (_) => Empresa(),
    "/my_fage": (_) => MyFage(),
  };

  static const String home = "/home";

  static const String cadastroCorp = "/register_corp";

  static const String cadastroUser = "/register_user";

  static const String agendamento = "/agendamento";

  static const String empresa = "/empresa";

  static const String myFage = "/my_fage";
}
