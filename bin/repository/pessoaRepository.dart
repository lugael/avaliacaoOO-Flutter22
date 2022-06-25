import '../model/aluno.dart';
import '../model/pessoa.dart';
import '../model/professor.dart';
import 'pessoa_repository_interface.dart';

class PessoaRepository implements IPessoaRepository {
  List<Pessoa> pessoas = [];

  @override
  void adicionarPessoa(Pessoa pessoa) {
    pessoas.add(pessoa);
    print('object');
  }

  @override
  bool? alterarPessoa(int? codigo,String? email, String? nome, DateTime? nascimento, String? endereco, double? salario) {
    return pessoas.any((element) {
      if (element.codigo == codigo) {
        nome != null ? element.nome = nome : '';
        email != null ? element.email = email : '';
        nascimento != null  ? element.nascimento = nascimento : '';
        endereco != null ? element.endereco = endereco : '';
        if(element is Professor)
        salario != null ? element.salario = salario : '';
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
      }else if(pessoa is Professor){
        print(pessoa);
      }
    }
  }

  @override
  Pessoa? buscarPessoa(String? email, int? codigo) {
    if(pessoas.isEmpty){
      return null;
    }
    
    if (email != null) {
      return pessoas.firstWhere((element) => element.email == email);
    } else if (codigo != null) {
      return pessoas.firstWhere((element) => element.codigo == codigo);
    }
    return null;
  }

  void listarPorCodigo(bool isAluno){
    for (var pessoa in pessoas) {
      if (pessoa is Aluno && isAluno) {
        print('Código: ${pessoa.codigo} Nome: ${pessoa.nome}');
      }else if(pessoa is Professor){
        print('Código: ${pessoa.codigo} Nome: ${pessoa.nome}');
      }
    }
  }
}
