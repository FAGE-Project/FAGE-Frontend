class EmpresaDTO {
  String? nome;

  EmpresaDTO({this.nome});

  static EmpresaDTO fromJson(dynamic json) {
    return EmpresaDTO(nome: json["nome"]);
  }

  static List<EmpresaDTO> fromJsonList(List<dynamic> json) {
    List<EmpresaDTO> empresaDTOList = [];
    json.forEach((element) {
      EmpresaDTO empresaDTO = EmpresaDTO(nome: element["nome"]);
      empresaDTOList.add(empresaDTO);
    });
    return empresaDTOList;
  }
}