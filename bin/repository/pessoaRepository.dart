import '../model/pessoa.dart';
import '../ui/pessoa_repository_interface.dart';

class PessoaRepository implements IPessoaRepository{
  List<Pessoa> pessoas = [];

  @override
  void adicionarPessoa(Pessoa pessoa) {
    pessoas.add(pessoa);
  }

  @override
  void alterarPessoa(String email) {
    // TODO: implement alterarPessoa
  }

  @override
  void excluirPessoa(String email) {
    // TODO: implement excluirPessoa
  }

  @override
  void listarPessoa() {
    // TODO: implement listarPessoa
  }

  @override
  Pessoa? buscarPessoa(String? email, int? codigo){
    if (email != null) {
     return pessoas.firstWhere((element) => element.email == email);
    }else if(codigo != null){
      return pessoas.firstWhere((element) => element.codigo == codigo);
    }else{
      return null;
    }

  }
}