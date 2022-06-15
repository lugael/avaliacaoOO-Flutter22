import '../model/pessoa.dart';

abstract class IPessoaRepository {

  void adicionarPessoa(Pessoa pessoa);

  void alterarPessoa(String email);

  void excluirPessoa(String email);

  void listarPessoa();

<<<<<<< HEAD
  
=======
  void buscarPessoa(String? email, int? codigo);
>>>>>>> 1045920084df0860770ec56fbb94b3b3ba4f603a

}
