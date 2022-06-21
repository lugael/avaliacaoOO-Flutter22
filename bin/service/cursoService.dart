import '../repository/cursoRepository.dart';
import 'pessoaService.dart';

class CursoService {
  CursoRepository cursoRepository;
  late PessoaService pessoaService;
  CursoService(this.cursoRepository); 
}