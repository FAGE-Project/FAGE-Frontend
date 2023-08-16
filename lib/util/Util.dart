import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Util {
  static var maskCPF = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  static var maskCEP = MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});

  static var maskTelefone = MaskTextInputFormatter(
      mask: '(##)#####-####', filter: {"#": RegExp(r'[0-9]')});
}