<<<<<<< HEAD
 abstract class Pessoa {
=======
abstract class Pessoa {
  static int contador = 0;
>>>>>>> cca2b8939b9ddd8428d2b381b560276d8c12d188
  int? codigo;
  String? email;
  String? nome;
  DateTime? nascimento;
  String? endereco;

<<<<<<< HEAD
  Pessoa({this.nome, this.email, this.nascimento, this.endereco});
}
=======
  Pessoa(){
    contador++;
    codigo = contador;
  }
}
>>>>>>> cca2b8939b9ddd8428d2b381b560276d8c12d188
