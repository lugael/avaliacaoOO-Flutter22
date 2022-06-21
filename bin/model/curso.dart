import 'pessoa.dart';

class Curso {
  static int contador = 0;
  int? codigo;
  String nome;
  int totalAlunos;
  List<Pessoa> pessoas = [];

  Curso(this.nome, this.totalAlunos){
    contador++;
    codigo = contador;
  }
}
