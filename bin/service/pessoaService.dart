import '../model/pessoa.dart';
import '../repository/pessoaRepository.dart';
import 'cursoService.dart';

class PessoaService{
  PessoaRepository pessoaRepository;
  
  late CursoService cursoService;

  PessoaService(this.pessoaRepository); 

  void adicionaCadastro(Pessoa pessoa){
    Pessoa? verifica = pessoaRepository.buscarPessoa(pessoa.email, null);
    if(verifica == null){
      pessoaRepository.pessoas.add(pessoa);
    }else{
      print('Email já existe');
    }
  }

  void alteraCadastro(String? email, int? codigo){
    Pessoa? verifica = pessoaRepository.buscarPessoa(email, codigo);
    if(verifica != null){
  
      pessoaRepository.alterarPessoa(verifica);
    }else{
      print('Cadastro não encontrado');
    }
  }

  void excluirCadastro(String? email){
    Pessoa? verifica = pessoaRepository.buscarPessoa(email, null);

  }
}