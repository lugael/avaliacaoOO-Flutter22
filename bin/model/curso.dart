import 'aluno.dart';
import 'pessoa.dart';
import 'professor.dart';

class Curso {
  static int contador = 0;
  late int codigo;
  String nome;
  int totalAlunos;
  List<Pessoa> pessoas = [];

  Curso(this.nome, this.totalAlunos) {
    contador++;
    codigo = contador;
  }

  @override
  String toString() {
    String profesores = '';
    String alunos = '';
    for (var pessoa in pessoas) {
      if (pessoa is Professor) {
        profesores += '\n${pessoa.nome}';
      }
    }
    for (var pessoa in pessoas) {
      if (pessoa is Aluno) {
        alunos += '\n${pessoa.nome}';
      }
    }

    return 'Codigo: $codigo \nNome: $nome \nTotal de alunos: $totalAlunos \nProfessores:${profesores != '' ?  profesores : 'Sem professor' } \nAlunos: ${alunos != '' ? alunos : 'Sem alunos'}';
  }

}
