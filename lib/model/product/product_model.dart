// ignore_for_file: non_constant_identifier_names

class ProductModel {
  int? prod_id;
  String? prod_nome;
  String? prod_descricao;
  double? prod_preco;

  ProductModel({
    this.prod_id,
    this.prod_nome,
    this.prod_descricao,
    this.prod_preco,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    prod_id = json['prod_id'];
    prod_nome = json['prod_nome'];
    prod_descricao = json['prod_descricao'];
    prod_preco = json['prod_preco'];
  }

  Map toJson() {
    return {
      'prod_id': prod_id,
      'prod_nome': prod_nome,
      'prod_descricao': prod_descricao,
      'prod_preco': prod_preco,
    };
  }
}
