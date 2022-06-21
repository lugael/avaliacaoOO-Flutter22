import '../model/pessoa.dart';
import 'pessoa_repository_interface.dart';

class PessoaRepository implements IPessoaRepository{
  List<Pessoa> pessoas = [];

  @override
  void adicionarPessoa(Pessoa pessoa) {
    pessoas.add(pessoa);
  }

  @override
  bool? alterarPessoa(Pessoa pessoa) {
    return pessoas.any((element) {
      if(element.codigo == pessoa.codigo){
        element = pessoa;
        return true;
      }
      return false;
    });
  }

  @override
  void excluirPessoa(Pessoa pessoa) {
    
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