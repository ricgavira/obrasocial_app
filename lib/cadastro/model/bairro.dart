class Bairro {
    int id;
    String nome;
    int cidadeId;

    Bairro({
      required this.id,
      required this.nome,
      required this.cidadeId
    });

    factory Bairro.fromMap(Map<String, dynamic> json) {
      return Bairro(
        id: json['id'],
        nome: json['nome'],
        cidadeId: json['cidadeId']
      );
    }

    Map<String, dynamic> toMap() {
      return {
        'nome': nome,
        'cidadeId': cidadeId
      };
    }
}