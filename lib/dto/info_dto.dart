class InfoDTO {
  int? status;
  Object? object;
  String message;

  InfoDTO(
      {this.object,
      this.status,
      this.message = "Ocorreu um erro, tente novamente mais tarde"});
}
