abstract class Pessoa {
  static int contador = 0;
  int? codigo;
  String? email;
  String? nome;
  DateTime? nascimento;
  String? endereco;

  Pessoa(){
    contador++;
    codigo = contador;
  }
}
