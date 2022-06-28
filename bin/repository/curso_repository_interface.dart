import '../model/curso.dart';
import '../model/pessoa.dart';

abstract class ICursoRepository {

  criarCurso (Curso curso);

  bool? alterarCurso (int codigo, String? nome, int? qtdPessoas, List<Pessoa>? pessoas);

  excluirCurso (Curso curso);

  listarCurso ();

  bool cursoExiste(int? codigo, String? nome);

  bool existeAluno(Pessoa aluno);

  listarCodigo();

  Curso? buscaCurso(int codigo);

  removePessoa(int codigo, Pessoa pessoa);
}