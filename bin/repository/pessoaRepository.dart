import '../model/aluno.dart';
import '../model/curso.dart';
import '../model/notaAluno.dart';
import '../model/pessoa.dart';
import '../model/professor.dart';
import 'pessoa_repository_interface.dart';

class PessoaRepository implements IPessoaRepository {
  List<Pessoa> pessoas = [];

  @override
  adicionarPessoa(Pessoa pessoa) {
    pessoas.add(pessoa);
    print('Cadastrado realizado');
  }

  @override
  bool? alterarPessoa(int? codigo, String? email, String? nome,
      DateTime? nascimento, String? endereco, double? salario) {
    return pessoas.any((element) {
      if (element.codigo == codigo) {
        nome != null ? element.nome = nome : '';
        email != null ? element.email = email : '';
        nascimento != null ? element.nascimento = nascimento : '';
        endereco != null ? element.endereco = endereco : '';
        if (element is Professor) {
          salario != null ? element.salario = salario : '';
        }
        print('Cadastro Alterado');
        return true;
      }
      return false;
    });
  }

  @override
  excluirPessoa(Pessoa pessoa) {
    pessoas.remove(pessoa);
  }

  @override
  listarPessoa(bool isAluno) {
    for (var pessoa in pessoas) {
      if (pessoa is Aluno && isAluno) {
        print(pessoa);
      } else if (pessoa is Professor) {
        print(pessoa);
      }
    }
  }

  @override
  Pessoa? buscarPessoa(String? email, int? codigo) {
    if (pessoas.isEmpty) {
      return null;
    }

    if (email != null) {
      return pessoas.firstWhere((element) => element.email == email);
    } else if (codigo != null) {
      return pessoas.firstWhere((element) => element.codigo == codigo);
    }
    return null;
  }

  @override
  listarPorCodigo(bool isAluno) {
    for (var pessoa in pessoas) {
      if (pessoa is Aluno && isAluno) {
        print('Código: ${pessoa.codigo} Nome: ${pessoa.nome}');
      } else if (pessoa is Professor && !isAluno) {
        print('Código: ${pessoa.codigo} Nome: ${pessoa.nome}');
      }
    }
  }

  @override
  adcionarNota(int codigo, NotaAluno notas) {
    pessoas.any((element) {
      if (element is Aluno) {
        if (element.codigo == codigo) {
          element.notas.add(notas);
          print('Nota(s) adicionada(s)');
          return true;
        }
      }
      return false;
    });
  }

  @override
  removerNota(int codigoP, Curso curso) {
    Pessoa pessoa = pessoas.firstWhere((element) => element.codigo == codigoP);
    if(pessoa is Aluno){
      pessoa.notas.removeWhere((element) => element.curso == curso);
      print('Notas Excluida');
    }
  }

  @override
  alterarNota(NotaAluno nota, int codigo){
    for (var item in pessoas) {
      if (item is Aluno) {
        for (var notas in item.notas) {
          notas.curso == nota.curso ? notas = nota : '';
        }
      }
    }
  }
}
