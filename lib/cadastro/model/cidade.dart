class Cidade {
    int id;
    String nome;
    int estadoId;

    Cidade({
      required this.id,
      required this.nome,
      required this.estadoId
    });

    factory Cidade.fromMap(Map<String, dynamic> json) {
      return Cidade(
        id: json['id'],
        nome: json['nome'],
        estadoId: json['estadoId']
      );
    }

    Map<String, dynamic> toMap() {
      return {
        'nome': nome,
        'estadoId': estadoId
      };
    }
}