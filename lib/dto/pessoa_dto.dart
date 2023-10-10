import 'package:fage/dto/endereco_dto.dart';

class PessoaDto {
  int? id;
  String? nome;
  String? password;
  String? email;
  String? documento;

  PessoaDto(
      {this.nome,
      this.id,
      this.documento,
      this.email,
      this.password,
      });

  static PessoaDto fromJson(dynamic json) {
    return PessoaDto(
      id: json["id"],
      nome: json["nome"],
      documento: json["documento"],
      email: json["email"],
      password: json["password"],
    );
  }

  static List<PessoaDto> fromJsonList(List<dynamic> json) {
    List<PessoaDto> list = [];
    json.forEach((element) {
      PessoaDto pessoaDto = PessoaDto(
        id: element["id"],
        nome: element["nome"],
        email: element["email"],
        password: element["password"],
        documento: element["documento"],
      );
      list.add(pessoaDto);
    });
    return list;
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'nome': nome,
        'email': email,
        'password': password,
        'documento': documento,
      };
}
