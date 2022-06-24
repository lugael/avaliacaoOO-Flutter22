import 'dart:ffi';

import '../model/pessoa.dart';
import '../repository/pessoaRepository.dart';
import 'cursoService.dart';

class PessoaService {
  PessoaRepository pessoaRepository;

  late CursoService cursoService;

  PessoaService(this.pessoaRepository);

  void adiciona(Pessoa pessoa) {
    pessoaRepository.adicionarPessoa(pessoa);
  }

  void altera(String? email, String? nome, DateTime? nascimento, String? endereco, double? salario) {
    Pessoa? verificaExistencia = pessoaRepository.buscarPessoa(email, null);
    pessoaRepository.alterarPessoa(verificaExistencia!.codigo, email, nome, nascimento, endereco, salario);
    
  }

  void excluir(String? email) {
    Pessoa? cadastroExiste = pessoaRepository.buscarPessoa(email, null);
    if (cadastroExiste != null) {
      bool verifica = cursoService.existeAluno(cadastroExiste);
      if(!verifica){
        pessoaRepository.excluirPessoa(cadastroExiste);
      }else{
        print('O aluno faz parte de um curso');
      }
    }else{
      print('Cadastro não existe');
    }
  }

  void listar(bool isAluno){
    pessoaRepository.listarPessoa(isAluno);
  }

  bool cadastroExiste(String email){
    return pessoaRepository.pessoas.any((element) => element.email == email);
  }

  Pessoa? busca(String? email, int? codigo){
    return pessoaRepository.buscarPessoa(email, codigo);
  }
}
