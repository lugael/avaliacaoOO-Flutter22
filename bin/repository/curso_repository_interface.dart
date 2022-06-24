import '../model/curso.dart';

abstract class ICursoRepository {

  void criarCurso (Curso curso);

  bool? alterarCurso (int codigo, String? nome, int? qtdPessoas);

  void excluirCurso (Curso curso);

  void listarCurso ();
}