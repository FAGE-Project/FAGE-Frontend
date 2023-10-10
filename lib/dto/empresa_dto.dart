import 'package:fage/dto/endereco_dto.dart';

class EmpresaDTO {
  int? id;
  String? nome;
  String? foto;
  int? nota;
  bool? aberta;
  String? descricao;
  String? documento;
  EnderecoDTO enderecoDTO;

  EmpresaDTO(
      {this.nome,
      this.id,
      this.foto,
      this.aberta,
      this.descricao,
      this.documento,
      this.nota,
      required this.enderecoDTO});

  static EmpresaDTO fromJson(dynamic json) {
    return EmpresaDTO(
      nome: json["nome"],
      id: json["id"],
      foto: json["foto"],
      aberta: json["aberta"],
      descricao: json["descricao"],
      documento: json["documento"],
      nota: json["nota"],
      enderecoDTO: EnderecoDTO(
          cidade: "Paranavaí",
          estado: "Paraná",
          complemento: "Residência",
          numero: 6547,
          rua: "Avenida Heitor de Alencar Furtado",
          cep: "84895-654"),
    );
  }

  static List<EmpresaDTO> fromJsonList(List<dynamic> json) {
    List<EmpresaDTO> empresaDTOList = [];
    json.forEach((element) {
      EmpresaDTO empresaDTO = EmpresaDTO(
        nome: element["nome"],
        id: element["id"],
        foto: element["foto"],
        aberta: element["aberta"],
        descricao: element["descricao"],
        documento: element["documento"],
        nota: element["nota"],
        enderecoDTO: EnderecoDTO(
            cidade: "Paranavaí",
            estado: "Paraná",
            complemento: "Residência",
            numero: 6547,
            rua: "Rua da puta que te pariu",
            cep: "84895-654"),
      );
      empresaDTOList.add(empresaDTO);
    });
    return empresaDTOList;
  }

  Map<dynamic, dynamic> toJson() =>
      {
        'id': id,
        'nome': nome,
        'foto': foto,
        'descricao': descricao,
      };
}
