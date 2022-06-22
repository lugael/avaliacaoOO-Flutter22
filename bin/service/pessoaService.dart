import '../model/pessoa.dart';
import '../repository/pessoaRepository.dart';
import 'cursoService.dart';

class PessoaService {
  PessoaRepository pessoaRepository;

  late CursoService cursoService;

  PessoaService(this.pessoaRepository);

  void adiciona(Pessoa pessoa) {
    Pessoa? verificaExistencia = pessoaRepository.buscarPessoa(pessoa.email, null);
    if (verificaExistencia == null) {
      pessoaRepository.adicionarPessoa(pessoa);
    } else {
      print('Email já existe');
    }
  }

  void altera(int? codigo, String? email, String? nome, DateTime? nascimento, String? endereco,) {
    pessoaRepository.alterarPessoa(codigo, email, nome, nascimento, endereco);
    
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

  Pessoa? busca(String? email, int? codigo){
     return pessoaRepository.buscarPessoa(email, codigo);
  }
}
