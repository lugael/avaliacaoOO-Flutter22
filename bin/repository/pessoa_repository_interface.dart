import '../model/pessoa.dart';

abstract class IPessoaRepository {

  void adicionarPessoa(Pessoa pessoa);

  void alterarPessoa(int? codigo,String? email, String? nome, DateTime? nascimento, String? endereco, double? salario);

  void excluirPessoa(Pessoa pessoa);

  void listarPessoa(bool isAluno);

  Pessoa? buscarPessoa(String? email, int? codigo);

}
