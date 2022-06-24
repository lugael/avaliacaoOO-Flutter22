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

  bool cursoExiste(int codigo){
    return cursoRepository.cursos.any((element) => element.codigo == codigo);
  }

  bool existeAluno(Pessoa aluno) {
    return cursoRepository.existeAluno(aluno);
  }

  void mostraCodigos(){
    cursoRepository.listarCodigo();
  }
}
