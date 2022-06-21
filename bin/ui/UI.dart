import 'dart:io';
import 'package:intl/intl.dart';
import '../model/pessoa.dart';
import '../repository/cursoRepository.dart';
import '../repository/pessoaRepository.dart';
import '../service/cursoService.dart';
import '../service/pessoaService.dart';

class Ui {

  late CursoService cursoService;
  late PessoaService pessoaService;

  Ui(){
    cursoService = CursoService(CursoRepository());
    pessoaService = PessoaService( PessoaRepository());
  }

  void show(){
    String? opc;
    do {
    print('Digite 1 para Alunos, 2 para Professores, ou 3 para curso');
    opc = stdin.readLineSync()!;
    switch (opc) {
      case '1':
      aluno();
      break;
      case '2':
      professor();
      break;
      case '3':
      curso();
      break;
      default:
    }
} while (opc == '3');
  }
  void aluno() {
    String? opc;
    do {
    print('Digite 1 para criar, 2 para alterar, 3 para excluir, 4 para listar ou 5 para sair');
    opc = stdin.readLineSync()!;
    switch (opc) {
      case '1':
      criarAluno;
      break;
      case '2':
      alterarAluno;
      break;
      case '3':
      excluirAluno;
      break;
      case '4':
      listarAluno;
      break;
      default:
    }
} while (opc != '5');
  }

  void professor() {
  }

  void curso(){}

  void criarAluno(){
    print('Informe o nome do Aluno');
    String nome = stdin.readLineSync()!;
    print('Informe o email do Aluno');
    String email = stdin.readLineSync()!;
    print('Informe o nascimento do Aluno');

    print('Informe o endereço do aluno');
    String endereco = stdin.readLineSync()!;
  }

  void alterarAluno(){}
  void excluirAluno(){}
  void listarAluno(){}
}

// criarAluno, alterar, excluir, listar
