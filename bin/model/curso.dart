import 'aluno.dart';
import 'pessoa.dart';

class Curso {
  static int contador = 0;
  late int codigo;
  String nome;
  int totalAlunos;
  List<Pessoa> pessoas = [];

  Curso(this.nome, this.totalAlunos){
    contador++;
    codigo = contador;
  }

  @override
  String toString() {
    return 'Codigo: $codigo \nNome: $nome \nTotal de alunos: $totalAlunos \nProfessores: $listarProfesores() \nAlunos: $listarAlunos()';
  }

  listarAlunos(){
    for (var pessoa in pessoas ) {
      if (pessoa is Aluno) {
        print('Aluno: ${pessoa.nome}');
      }
    }
  }

  listarProfesores(){
    for (var pessoa in pessoas) {
      print('Professor: ${pessoa.nome}');
    }
  }
}
