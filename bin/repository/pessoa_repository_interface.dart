import '../model/curso.dart';
import '../model/notaAluno.dart';
import '../model/pessoa.dart';

abstract class IPessoaRepository {

  bool adicionarPessoa(Pessoa pessoa);

  bool alterarPessoa(int? codigo,String? email, String? nome, DateTime? nascimento, String? endereco, double? salario);

  bool excluirPessoa(Pessoa pessoa);

  listarPessoa(bool isAluno);

  Pessoa? buscarPessoa(String? email, int? codigo);

  listarPorCodigo(bool isAluno);

  bool adicionarNota(int codigo, NotaAluno notas);

  bool removerNota(int codigoP, Curso curso);

  bool alterarNota(NotaAluno nota, int codigo);
}
