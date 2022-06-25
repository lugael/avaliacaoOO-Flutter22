import '../model/curso.dart';
import '../model/pessoa.dart';
import '../repository/cursoRepository.dart';
import 'pessoaService.dart';

class CursoService {
  CursoRepository cursoRepository;
  late PessoaService pessoaService;
  CursoService(this.cursoRepository);

  void adiciona(Curso curso){
    cursoRepository.criarCurso(curso);
  }

  void altera(int codigo, String? nome, int? qtdPessoas){
    cursoRepository.alterarCurso(codigo, nome, qtdPessoas);
  }

  bool cursoExiste(int? codigo, String? nome){
    if (codigo != null) {
      return cursoRepository.cursos.any((element) => element.codigo == codigo);
    }else if (nome != null) {
      return cursoRepository.cursos.any((element) => element.nome == nome);
    }
    return false; 
  }

  bool existeAluno(Pessoa aluno) {
    return cursoRepository.existeAluno(aluno);
  }

  void mostraCodigos(){
    cursoRepository.listarCodigo();
  }

  void listar(){
    cursoRepository.listarCurso();
  }

  void excluir(int codigo){
    Curso curso = cursoRepository.cursos.firstWhere((element) => element.codigo == codigo);
    if (curso.pessoas.isEmpty) {
      cursoRepository.excluirCurso(curso);
    }else{
      print('Curso possui aluno');
    }

  }
}
