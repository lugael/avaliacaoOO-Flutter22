import '../model/curso.dart';
import '../model/pessoa.dart';
import 'curso_repository_interface.dart';


class CursoRepository implements ICursoRepository{
  List<Curso> cursos = [];
 
  @override
  void criarCurso(Curso curso) {
    cursos.add(curso);
  }

  @override
  bool? alterarCurso(int codigo, String? nome, int? qtdPessoas) {
    return cursos.any((element) {
      if(element.codigo == codigo){
        nome != null ? element.nome = nome : '';
        qtdPessoas != null ? element.totalAlunos = qtdPessoas : '';
        return true;
      }
      return false;
    });
  }

  @override
  void excluirCurso(Curso curso) {
    cursos.remove(curso);
  }

  @override
  void listarCurso() {
    for (var curso in cursos) {
      print(curso);
    }
  }

  void listarCodigo(){
     for (var curso in cursos) {
      print('Cógigo: ${curso.codigo} \nNome: ${curso.nome}');
    }
  }

  bool existeAluno(Pessoa aluno){
    for (var item in cursos) {
      if(item.pessoas.contains(aluno)){
        return true;
      }
    }
    return false;
  }

}