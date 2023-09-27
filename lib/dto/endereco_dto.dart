class EnderecoDTO {
  int? id;
  int? numero;
  String? rua;
  String? complemento;
  String? cidade;
  String? estado;
  String? cep;

  EnderecoDTO(
      {this.id,
        this.numero,
        this.rua,
        this.complemento,
        this.cidade,
        this.estado,
      this.cep});

  static EnderecoDTO fromJson(dynamic json) {
    return EnderecoDTO(
      id: json["id"],
      numero: json["numero"],
      rua: json["rua:"],
      complemento: json["complemento"],
      cidade: json["cidade"],
      estado: json["estado"],
      cep: json["cep"],
    );
  }

  static List<EnderecoDTO> fromJsonList(List<dynamic> json) {
    List<EnderecoDTO> EnderecoDTOList = [];
    json.forEach((element) {
      EnderecoDTO enderecoDTO = EnderecoDTO(
        id: element["id"],
        numero: element["numero"],
        rua: element["rua"],
        complemento: element["complemento"],
        cidade: element["cidade"],
        estado: element["estado"],
        cep: element["cep"],
      );
      EnderecoDTOList.add(enderecoDTO);
    });
    return EnderecoDTOList;
  }
}
