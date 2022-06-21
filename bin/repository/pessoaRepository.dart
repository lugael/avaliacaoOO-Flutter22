import '../model/aluno.dart';
import '../model/pessoa.dart';
import '../model/professor.dart';
import 'pessoa_repository_interface.dart';

class PessoaRepository implements IPessoaRepository {
  List<Pessoa> pessoas = [];

  @override
  void adicionarPessoa(Pessoa pessoa) {
    pessoas.add(pessoa);
  }

  @override
  bool? alterarPessoa(Pessoa pessoa) {
    return pessoas.any((element) {
      if (element.codigo == pessoa.codigo) {
        pessoa.nome != null ? element.nome = pessoa.nome : '';
        pessoa.email != null ? element.email = pessoa.email : '';
        pessoa.nascimento != null  ? element.nascimento = pessoa.nascimento : '';
        pessoa.endereco != null ? element.endereco = pessoa.endereco : '';
        return true;
      }
      return false;
    });
  }

  @override
  void excluirPessoa(Pessoa pessoa) {
    pessoas.remove(pessoa);
  }

  @override
  void listarPessoa(bool isAluno) {
    for (var pessoa in pessoas) {
      if (pessoa is Aluno && isAluno) {
        print(pessoa);
      }else if(pessoa is Professor && !isAluno){
        print(pessoa);
      }
    }
  }

  @override
  Pessoa? buscarPessoa(String? email, int? codigo) {
    if (email != null) {
      return pessoas.firstWhere((element) => element.email == email);
    } else if (codigo != null) {
      return pessoas.firstWhere((element) => element.codigo == codigo);
    } else {
      return null;
    }
  }
}
