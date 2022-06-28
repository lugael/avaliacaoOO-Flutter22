import '../model/curso.dart';
import '../model/pessoa.dart';

abstract class ICursoRepository {

  bool criarCurso (Curso curso);

  bool alterarCurso (int codigo, String? nome, int? qtdPessoas, List<Pessoa>? pessoas);

  bool excluirCurso (Curso curso);

  listarCurso ();

  bool cursoExiste(int? codigo, String? nome);

  bool existeAluno(Pessoa aluno);

  listarCodigo();

  Curso? buscaCurso(int codigo);

  bool removePessoa(int codigo, Pessoa pessoa);
}