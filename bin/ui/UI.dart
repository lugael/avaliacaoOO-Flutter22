import 'dart:io';
import 'package:intl/intl.dart';
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
        default:
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
          criarProfessor;
          break;
        case '2':
          alterarProfessor;
          break;
        case '3':
          excluirProfessor;
          break;
        case '4':
          listarProfessor;
          break;
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
          criarCurso;
          break;
        case '2':
          alterarCurso;
          break;
        case '3':
          excluirCurso;
          break;
        case '4':
          listarCurso;
          break;
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
  }

  void alterarAluno() {
    print('Informe o email do Aluno');
    String email = stdin.readLineSync()!;
    print('Informe o nome do Aluno');
    String? nome = stdin.readLineSync();
    print('Informe o nascimento do Aluno no formato 00/00/0000');
    DateTime? nascimento = df.parse(stdin.readLineSync()!);
    print('Informe o endereço do Aluno');
    String? endereco = stdin.readLineSync();
    // email - nome - nascimento - endereco
  }

  void excluirAluno() {
    print('Informe o email do Aluno');
    String email = stdin.readLineSync()!;
    // email
  }
  void listarAluno() {}

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
