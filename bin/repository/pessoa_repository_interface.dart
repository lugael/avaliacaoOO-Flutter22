import '../model/curso.dart';
import '../model/notaAluno.dart';
import '../model/pessoa.dart';

abstract class IPessoaRepository {

  adicionarPessoa(Pessoa pessoa);

  alterarPessoa(int? codigo,String? email, String? nome, DateTime? nascimento, String? endereco, double? salario);

  excluirPessoa(Pessoa pessoa);

  listarPessoa(bool isAluno);

  Pessoa? buscarPessoa(String? email, int? codigo);

  listarPorCodigo(bool isAluno);

  adcionarNota(int codigo, NotaAluno notas);

  removerNota(int codigoP, Curso curso);

  alterarNota(NotaAluno nota, int codigo);
}
