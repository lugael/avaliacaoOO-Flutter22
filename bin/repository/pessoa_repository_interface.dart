import '../model/pessoa.dart';

abstract class IPessoaRepository {

  void adicionarPessoa(Pessoa pessoa);

  void alterarPessoa(Pessoa pessoa);

  void excluirPessoa(Pessoa pessoa);

  void listarPessoa(bool isAluno);

  Pessoa? buscarPessoa(String? email, int? codigo);

}
