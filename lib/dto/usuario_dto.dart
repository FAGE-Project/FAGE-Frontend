class UsuarioDTO {
  int? id;
  String? nome;
  String? email;
  String? senha;
  String? documento;

  UsuarioDTO({this.nome, this.id, this.email, this.senha, this.documento});

  static UsuarioDTO fromJson(dynamic json) {
    return UsuarioDTO(
        nome: json["nome"],
        id: json["id"],
        email: json["email"],
        senha: json["senha"],
        documento: json["documento"]);
  }

  static List<UsuarioDTO> fromJsonList(List<dynamic> json) {
    List<UsuarioDTO> usuarioDTOList = [];
    json.forEach((element) {
      UsuarioDTO usuarioDTO = UsuarioDTO(
        nome: element["nome"],
        id: element["id"],
        email: element["email"],
        senha: element["senha"],
        documento: element["documento"],
      );
      usuarioDTOList.add(usuarioDTO);
    });
    return usuarioDTOList;
  }

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'email': email,
        'password': senha,
        'documento': documento,
      };
}
