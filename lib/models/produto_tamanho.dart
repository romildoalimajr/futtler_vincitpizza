class ProdutoTamanho {
  String? descricao;
  String? valor;

  ProdutoTamanho({this.descricao, this.valor});

  factory ProdutoTamanho.fromJson(Map<String, dynamic> json) {
    return ProdutoTamanho(descricao: json["descricao"], valor: json["valor"]);
  }
}
