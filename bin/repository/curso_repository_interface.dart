import '../model/curso.dart';
import '../model/pessoa.dart';

abstract class ICursoRepository {

  void criarCurso (Curso curso);

  bool? alterarCurso (int codigo, String? nome, int? qtdPessoas, List<Pessoa> pessoas);

  void excluirCurso (Curso curso);

  void listarCurso ();
}