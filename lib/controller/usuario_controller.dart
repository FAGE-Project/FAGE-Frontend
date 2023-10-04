import 'dart:convert';

import 'package:fage/dto/empresa_dto.dart';
import 'package:fage/dto/info_dto.dart';
import 'package:fage/dto/usuario_dto.dart';
import 'package:fage/util/util.dart';
import 'package:http/http.dart' as http;

class UsuarioController {
  static Future<InfoDTO> cadastrarUsuario(UsuarioDTO usuarioDTO) async {
    final response = await http.post(
      Uri.parse('${Util.baseUrl}/cadastro'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(usuarioDTO.toJson()),
    );
    return InfoDTO(
        status: response.statusCode,
        object: response.body,
        message: response.body);
  }
}
