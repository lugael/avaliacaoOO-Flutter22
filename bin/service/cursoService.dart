import '../model/pessoa.dart';
import '../repository/cursoRepository.dart';
import 'pessoaService.dart';

class CursoService {
  CursoRepository cursoRepository;
  late PessoaService pessoaService;
  CursoService(this.cursoRepository);

   bool existeAluno(Pessoa aluno){
      return cursoRepository.existeAluno(aluno);
  } 
}