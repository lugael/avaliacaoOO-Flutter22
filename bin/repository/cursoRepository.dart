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
  bool? alterarCurso(Curso curso) {
    return cursos.any((element) {
      if(element.codigo == curso.codigo){
        element = curso;
        return true;
      }
      return false;
    });
  }

  @override
  void excluirCurso(Curso curso) {
    // TODO: implement excluirCurso
  }

  @override
  void listarCurso() {
    // TODO: implement listarCurso
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