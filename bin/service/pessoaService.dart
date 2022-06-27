import '../model/curso.dart';
import '../model/notaAluno.dart';
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

  void altera(int codigo, String? email, String? nome, DateTime? nascimento,
      String? endereco, double? salario) {
    pessoaRepository.alterarPessoa(
        codigo, email, nome, nascimento, endereco, salario);
  }

  void excluir(String? email) {
    Pessoa? cadastroExiste = pessoaRepository.buscarPessoa(email, null);
    if (cadastroExiste != null) {
      bool verifica = cursoService.existeAluno(cadastroExiste);
      if (!verifica) {
        pessoaRepository.excluirPessoa(cadastroExiste);
      } else {
        print('O aluno faz parte de um curso');
      }
    } else {
      print('Cadastro não existe');
    }
  }

  void listar(bool isAluno) {
    pessoaRepository.listarPessoa(isAluno);
  }

  bool cadastroExiste(String email) {
    return pessoaRepository.pessoas.any((element) => element.email == email);
  }

  Pessoa? busca(String? email, int? codigo) {
    return pessoaRepository.buscarPessoa(email, codigo);
  }

  void buscarCodigo(bool isAluno) {
    pessoaRepository.listarPorCodigo(isAluno);
  }

  void adiconaNota(int codigo, NotaAluno notas) {
    pessoaRepository.adcionarNota(codigo, notas);
  }

  void removerNota(int codigo, Curso curso) {
    pessoaRepository.removerNota(codigo, curso);
  }
}
