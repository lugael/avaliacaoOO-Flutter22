import '../model/aluno.dart';
import '../model/pessoa.dart';
import '../model/professor.dart';
import '../ui/pessoa_repository_interface.dart';

class PessoaRepository implements IPessoaRepository{
  List<Pessoa> pessoas = [];

  @override
  void adicionarPessoa(Pessoa pessoa) {
    // TODO: implement adicionarPessoa
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
  void buscarPessoa(String? email, int? codigo) {
    // TODO: implement buscarPessoa
  }

}