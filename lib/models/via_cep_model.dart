class ViaCEPModel {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ddd;

  ViaCEPModel({
    String? cep,
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
    String? uf,
    String? ddd,
  }) {
    if (cep != null) {
      cep = cep;
    }
    if (logradouro != null) {
      logradouro = logradouro;
    }
    if (complemento != null) {
      complemento = complemento;
    }
    if (bairro != null) {
      bairro = bairro;
    }
    if (localidade != null) {
      localidade = localidade;
    }
    if (uf != null) {
      uf = uf;
    }
    if (ddd != null) {
      ddd = ddd;
    }
  }

  ViaCEPModel.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ddd = json['ddd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ddd'] = ddd;
    return data;
  }
}
