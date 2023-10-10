import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fage/dto/agendamento_dto.dart';
import 'package:fage/dto/empresa_dto.dart';
import 'package:fage/util/util.dart';
import 'package:http/http.dart' as http;

class AgendamentoController {

  static Future<List<AgendamentoDto>> buscarAgendamentos() async {
    final response = await http.get(
      Uri.parse('${Util.baseUrl}/agendamentos'),
    );

    return AgendamentoDto.fromJsonList(json.decode(response.body));
  }

  static Future<AgendamentoDto> buscarAgendamentoPorId(int id) async {
    final response = await http.get(
      Uri.parse('${Util.baseUrl}/agendamentos/$id'),
    );

    return AgendamentoDto.fromJson(json.decode(response.body));
  }

  static Future<bool> cadastrar(AgendamentoDto agendamentoDto) async {
    var data = json.encode(agendamentoDto.toJson());
    var dio = Dio();
    var response = await dio.request(
      '${Util.baseUrl}/agendamentos',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    if (response.statusCode == 201) {
      return true;
    }
    else {
      return false;
    }
  }
}
