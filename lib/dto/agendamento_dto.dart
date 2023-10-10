import 'package:fage/dto/empresa_dto.dart';
import 'package:fage/dto/pessoa_dto.dart';
import 'package:fage/dto/servico_dto.dart';

class AgendamentoDto {
  int? id;
  PessoaDto? pessoa;
  DateTime? dataHora;
  ServicoDto? servicoDto;

  AgendamentoDto(
      {
      this.id,
      this.pessoa,
      this.dataHora,
      this.servicoDto,
      });

  static AgendamentoDto fromJson(dynamic json) {
    return AgendamentoDto(
      id: json["id"],
      pessoa: PessoaDto.fromJson(json["pessoa"]),
      dataHora: json["dataHora"],
      servicoDto: ServicoDto.fromJson(json["servicoDto"]),
    );
  }

  static List<AgendamentoDto> fromJsonList(List<dynamic> json) {
    List<AgendamentoDto> list = [];
    json.forEach((element) {
      AgendamentoDto agendamentoDto = AgendamentoDto(
        id: element["id"],
        dataHora: element["dataHora"],
        pessoa: PessoaDto.fromJson(element["pessoa"],),
        servicoDto: ServicoDto.fromJson(element["servicoDto"]),
      );
      list.add(agendamentoDto);
    });
    return list;
  }

  Map<dynamic, dynamic> toJson() =>
      {
        'id': id,
        'pessoa': pessoa!.toJson(),
        'dataHora': dataHora!.toIso8601String(),
        'servicoDto': servicoDto!.toJson(),
      };
}
