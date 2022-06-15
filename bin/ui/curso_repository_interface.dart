import '../model/curso.dart';

abstract class ICursoRepository {

  void criarCurso (Curso curso);

  void alterarCurso (int codigo);

  void excluirCurso (int codigo);

  void listarCurso ();
}