import 'package:obrasocial_app/cadastro/enum/tipo_contato.dart';
import 'package:obrasocial_app/util/enum_utils.dart';

class Contato {
    int id;
    String descricao;
    String responsavel;
    TipoContato tipoContato;
    int? pessoaFisicaId;
    int? pessoaJuridicaId;

    Contato({
      required this.id,
      required this.descricao,
      required this.responsavel,
      required this.tipoContato,
      this.pessoaFisicaId,
      this.pessoaJuridicaId
    });

    factory Contato.fromMap(Map<String, dynamic> json) {
      return Contato(
        id: json['id'],
        descricao: json['descricao'],
        responsavel: json['responsavel'],
        tipoContato: EnumUtils.enumFromString(TipoContato.values, json['tipocontato']),
        pessoaFisicaId: json['pessoaFisicaId'],
        pessoaJuridicaId: json['pessoaJuridicaId']
      );
    }

  Map<String, dynamic> toMap() {
    return {
      'descricao': descricao,
      'responsavel': responsavel,
      'tipoContato': tipoContato.toString().split('.').last,
      'pessoaFisicaId': pessoaFisicaId,
      'pessoaJuridicaId': pessoaJuridicaId
    };
  }

  static List<Contato> fromJsonArray(List<dynamic> jsonArray) {
    return jsonArray.map((json) => Contato.fromMap(json)).toList();
  }    
}