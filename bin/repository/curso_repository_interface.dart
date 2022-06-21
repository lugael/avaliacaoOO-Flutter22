import '../model/curso.dart';

abstract class ICursoRepository {

  void criarCurso (Curso curso);

  bool? alterarCurso (Curso curso);

  void excluirCurso (Curso curso);

  void listarCurso ();
}