import 'curso.dart';

class NotaAluno {
  List<double> notas = [];
  Curso curso;

  NotaAluno(this.notas, this.curso);

  void printNota(){
    for (var i = 0; i < notas.length; i++) {
      print('Nota $i: ${notas[i]}');
    }
  }

  @override
  String toString() {
    return "Curso: $curso\n $printNota()";
  }
}
