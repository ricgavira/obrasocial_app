import 'dart:typed_data';

import 'package:obrasocial_app/cadastro/enum/raca.dart';
import 'package:obrasocial_app/cadastro/enum/sexo.dart';
import 'package:obrasocial_app/cadastro/model/contato.dart';
import 'package:obrasocial_app/cadastro/model/endereco.dart';
import 'package:obrasocial_app/util/enum_utils.dart';

class PessoaFisica {
    int id;
    String nome;
    String cpf;
    String rg;
    String nomeDaMae;
    String nomeDoPai;
    Raca raca;
    Sexo sexo;
    String naturalidade;
    String nacionalidade;
    DateTime dataNascimento;
    Uint8List foto;
    List<Contato> contatos;
    List<Endereco> enderecos;

  PessoaFisica({
        required this.id,
        required this.nome,
        required this.cpf,
        required this.rg,
        required this.nomeDaMae,
        required this.nomeDoPai,
        required this.raca,
        required this.sexo,
        required this.naturalidade,
        required this.nacionalidade,
        required this.dataNascimento,
        required this.foto,
        required this.contatos,
        required this.enderecos
  });

  factory PessoaFisica.fromMap(Map<String, dynamic> json) {
    // Ao processar dados de um JSON, você pode converter os bytes para Uint8List
    final photoBytes = json['foto'] as List<int>;
    final photoUint8List = Uint8List.fromList(photoBytes);

    final contatosJson = json['contatos'] as List<dynamic>;
    final List<Contato> contatoList = Contato.fromJsonArray(contatosJson);
    
    final enderecosJson = json['enderecos'] as List<dynamic>;
    final List<Endereco> enderecoList = Endereco.fromJsonArray(enderecosJson);

    return PessoaFisica(
        id: json['id'],
        nome: json['nome'],
        cpf: json['cpf'],
        rg: json['rg'],
        nomeDaMae: json['nomeDaMae'],
        nomeDoPai: json['nomeDoPai'],
        raca: json['raca'],
        sexo: EnumUtils.enumFromString(Sexo.values, json['sexo']),
        naturalidade: json['naturalidade'],
        nacionalidade: json['nacionalidade'],
        dataNascimento: json['dataNascimento'],
        foto: photoUint8List,
        contatos: contatoList,
        enderecos: enderecoList
    );
  }

    Map<String, dynamic> toMap() {
      return {
        'nome': nome,
        'cpf': cpf,
        'rg': rg,
        'nomeDaMae': nomeDaMae,
        'nomeDoPai': nomeDoPai,
        'raca': raca.toString().split('.').last,
        'sexo': sexo.toString().split('.').last,
        'naturalidade': naturalidade,
        'nacionalidade': nacionalidade,
        'dataNascimento': dataNascimento,
        'foto': foto,
        'contatos': contatos.map((contato) => contato.toMap()).toList(),
        'enderecos': enderecos.map((endereco) => endereco.toMap()).toList()
     };
    }
}