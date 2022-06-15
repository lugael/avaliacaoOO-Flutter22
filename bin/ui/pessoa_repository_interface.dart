import '../model/pessoa.dart';

abstract class IPessoaRepository {

  void adicionarPessoa(Pessoa pessoa);

  void alterarPessoa(String email);

  void excluirPessoa(String email);

  void listarPessoa();

  

}
