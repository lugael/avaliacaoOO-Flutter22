abstract class Pessoa {
  static int contador = 0;
  int? codigo;
  String nome;
  String email;
  DateTime nascimento;
  String? endereco;

  Pessoa({required this.nome, required this.email, required this.nascimento, this.endereco}) {
    contador++;
    codigo = contador;
  }
}
