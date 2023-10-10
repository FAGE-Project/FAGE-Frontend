import 'package:fage/dto/empresa_dto.dart';
import 'package:fage/dto/endereco_dto.dart';

class ServicoDto {
  int? id;
  String? nome;
  String? foto;
  double? preco;
  String? descricao;
  EmpresaDTO? empresaDTO;

  ServicoDto(
      {this.nome,
      this.id,
      this.foto,
      this.descricao,
      this.preco,
      this.empresaDTO});

  static ServicoDto fromJson(dynamic json) {
    return ServicoDto(
      nome: json["nome"],
      id: json["id"],
      foto: json["foto"],
      descricao: json["descricao"],
      preco: json["preco"],
      empresaDTO: EmpresaDTO.fromJson(json["empresa_dto"]),
    );
  }

  static List<ServicoDto> fromJsonList(List<dynamic> json) {
    List<ServicoDto> servicoDtoList = [];
    json.forEach((element) {
      ServicoDto servicoDto = ServicoDto(
        id: element["id"],
        nome: element["nome"],
        foto: element["foto"],
        descricao: element["descricao"],
        preco: element["preco"],
        empresaDTO: EmpresaDTO.fromJson(element["empresaDto"]),
      );
      servicoDtoList.add(servicoDto);
    });
    return servicoDtoList;
  }

  Map<dynamic, dynamic> toJson() =>
      {
        'id': id,
        'nome': nome,
        'foto': foto,
        'descricao': descricao,
        'preco': descricao,
        'empresa_dto': empresaDTO != null ? empresaDTO!.toJson() : '',
      };
}
