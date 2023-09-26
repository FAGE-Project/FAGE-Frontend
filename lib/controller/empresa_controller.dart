import 'dart:convert';

import 'package:fage/dto/empresa_dto.dart';
import 'package:http/http.dart' as http;

class EmpresaController {

  static Future<List<EmpresaDTO>> buscarEmpresas() async {
    final response = await http.get(
      Uri.parse('https://3414-200-17-101-78.ngrok.io/empresa'),
    );

    return EmpresaDTO.fromJsonList(json.decode(response.body));
  }
}
