import 'package:obrasocial_app/cadastro/enum/tipo_endereco.dart';
import 'package:obrasocial_app/cadastro/model/bairro.dart';
import 'package:obrasocial_app/util/enum_utils.dart';

class Endereco {
    int id;
    String nome;
    Bairro bairro;
    String numero;
    String cep;
    TipoEndereco tipoEndereco;

  Endereco({
    required this.id,
    required this.nome,
    required this.bairro,
    required this.numero,
    required this.cep,
    required this.tipoEndereco
  });

  factory Endereco.fromMap(Map<String, dynamic> json) {
    return Endereco(
      id: json['id'],
      nome: json['nome'],
      bairro: Bairro.fromMap(json['bairro']),
      numero: json['numero'],
      cep: json['cep'],
      tipoEndereco: EnumUtils.enumFromString(TipoEndereco.values, json['tipoEndereco'])
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'bairro': bairro,
      'numero': numero,
      'cep': cep,
      'tipoEndereco': tipoEndereco.toString().split('.').last
    };
  }

  static List<Endereco> fromJsonArray(List<dynamic> jsonArray) {
    return jsonArray.map((json) => Endereco.fromMap(json)).toList();
  }
}