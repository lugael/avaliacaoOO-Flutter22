import 'dart:io';
import 'package:intl/intl.dart';
import '../model/aluno.dart';
import '../model/curso.dart';
import '../model/pessoa.dart';
import '../repository/cursoRepository.dart';
import '../repository/pessoaRepository.dart';
import '../service/cursoService.dart';
import '../service/pessoaService.dart';

class Ui {
  late CursoService cursoService;
  late PessoaService pessoaService;
  DateFormat df = DateFormat('dd/MM/yyyy');

  Ui() {
    cursoService = CursoService(CursoRepository());
    pessoaService = PessoaService(PessoaRepository());
  }

  void show() {
    String? opc;
    do {
      print('Digite 1 para Alunos, 2 para Professores, ou 3 para Curso');
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
        case '4':
          print('Saindo...');
          break;
        default:
          print('Valor invalido');
      }
    } while (opc != '4');
  }

  void aluno() {
    String? opc;
    do {
      print(
          'Digite 1 para criar, 2 para alterar, 3 para excluir, 4 para listar ou 5 para sair');
      opc = stdin.readLineSync()!;
      switch (opc) {
        case '1':
          criarAluno();
          break;
        case '2':
          alterarAluno();
          break;
        case '3':
          excluirAluno();
          break;
        case '4':
          listarAluno();
          break;
        case '5':
          print('Saindo...');
          break;
        default:
          print('Valor invalido');
      }
    } while (opc != '5');
  }

  void professor() {
    String? opc;
    do {
      print(
          'Digite 1 para criar, 2 para alterar, 3 para excluir, 4 para listar ou 5 para sair');
      opc = stdin.readLineSync()!;
      switch (opc) {
        case '1':
          criarProfessor();
          break;
        case '2':
          alterarProfessor();
          break;
        case '3':
          excluirProfessor();
          break;
        case '4':
          listarProfessor();
          break;
        case '5':
          print('Saindo...');
          break;
        default:
          print('Valor invalido');
      }
    } while (opc != '5');
  }

  void curso() {
    String? opc;
    do {
      print(
          'Digite 1 para criar, 2 para alterar, 3 para excluir, 4 para listar ou 5 para sair');
      opc = stdin.readLineSync()!;
      switch (opc) {
        case '1':
          criarCurso();
          break;
        case '2':
          alterarCurso();
          break;
        case '3':
          excluirCurso();
          break;
        case '4':
          listarCurso();
          break;
        case '5':
          print('Saindo...');
          break;
        default:
          print('Valor invalido');
      }
    } while (opc != '5');
  }

  void criarAluno() {
    print('Informe o nome do Aluno');
    String nome = stdin.readLineSync()!;
    print('Informe o email do Aluno');
    String email = stdin.readLineSync()!;
    print('Informe o nascimento do Aluno no formato 00/00/0000');
    DateTime nascimento = df.parse(stdin.readLineSync()!);
    print('Informe o endereço do aluno');
    String? endereco = stdin.readLineSync();
    Pessoa aluno = Aluno(
        nome: nome, email: email, nascimento: nascimento, endereco: endereco);
    pessoaService.adiciona(aluno);
  }

  void alterarAluno() {
    print('Informe o email do Aluno');
    String email = stdin.readLineSync()!;
    Pessoa? verificaExistencia = pessoaService.busca(email, null);
    if(verificaExistencia != null){
      print('Informe o nome do Aluno');
      String? nome = stdin.readLineSync();
      print('Informe o nascimento do Aluno no formato 00/00/0000');
      DateTime? nascimento = df.parse(stdin.readLineSync()!);
      print('Informe o endereço do Aluno');
      String? endereco = stdin.readLineSync();
      pessoaService.altera(verificaExistencia.codigo, email, nome, nascimento, endereco);
    }else{
      print('Cadastros não encontrado');
    }
    
    // email - nome - nascimento - endereco
  }

  void excluirAluno() {
    print('Informe o email do Aluno');
    String email = stdin.readLineSync()!;
    pessoaService.excluir(email);
    // email
  }

  void listarAluno() {
    pessoaService.listar(true);
  }

  void criarProfessor() {}
  void alterarProfessor() {}
  void excluirProfessor() {}
  void listarProfessor() {}

  void criarCurso() {}
  void alterarCurso() {}
  void excluirCurso() {}
  void listarCurso() {}
}

// criarAluno, alterar, excluir, listar
