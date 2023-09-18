import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  final response = await http.get(Uri.parse('https://sua-api.com/exemplo'));
  if (response.statusCode == 200) {
    print('Dados da resposta: ${response.body}');
    // Você pode analisar os dados da resposta aqui
  } else {
    print('A requisição falhou com o status: ${response.statusCode}');
  }
}