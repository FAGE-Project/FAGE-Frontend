import 'dart:convert';

import 'package:fage/dto/empresa_dto.dart';
import 'package:fage/util/util.dart';
import 'package:http/http.dart' as http;

class EmpresaController {

  static Future<List<EmpresaDTO>> buscarEmpresas() async {
    final response = await http.get(
      Uri.parse('${Util.baseUrl}/empresa'),
    );

    return EmpresaDTO.fromJsonList(json.decode(response.body));
  }

  static Future<EmpresaDTO> buscarEmpresaId(int id) async {
    final response = await http.get(
      Uri.parse('${Util.baseUrl}/empresa/$id'),
    );

    return EmpresaDTO.fromJson(json.decode(response.body));
  }
}
