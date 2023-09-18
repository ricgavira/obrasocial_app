class Estado {
    int id;
    String nome;
    String sigla;

    Estado({
      required this.id,
      required this.nome,
      required this.sigla
    });

    factory Estado.fromMap(Map<String, dynamic> json) {
      return Estado(
        id: json['id'],
        nome: json['nome'],
        sigla: json['sigla']
      );
    }

    Map<String, dynamic> toMap() {
      return {
        'nome': nome,
        'sigla': sigla
      };
    }
}