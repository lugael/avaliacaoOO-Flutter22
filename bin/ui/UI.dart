import 'dart:io';
import 'package:intl/intl.dart';
import '../model/aluno.dart';
import '../model/curso.dart';
import '../model/pessoa.dart';
import '../model/professor.dart';
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
    print('Informe o email do Aluno');
    String email = stdin.readLineSync()!;
    bool verificaExistencia = pessoaService.cadastroExiste(email);
    if (!verificaExistencia) {
      print('Informe o nome do Aluno');
      String nome = stdin.readLineSync()!;
      print('Informe o nascimento do Aluno no formato 00/00/0000');
      DateTime nascimento = df.parse(stdin.readLineSync()!);
      print('Informe o endereço do aluno');
      String? endereco = stdin.readLineSync();
      Pessoa aluno = Aluno(
          nome: nome, email: email, nascimento: nascimento, endereco: endereco);
      pessoaService.adiciona(aluno);
    } else {
      print('Cadastro já existe');
    }
  }

  void alterarAluno() {
    print('Informe o email do Aluno');
    String email = stdin.readLineSync()!;
    bool verificaExistencia = pessoaService.cadastroExiste(email);
    if (verificaExistencia) {
      print('Informe o nome do Aluno');
      String? nome = stdin.readLineSync();
      print('Informe o nascimento do Aluno no formato 00/00/0000');
      DateTime? nascimento = df.parse(stdin.readLineSync()!);
      print('Informe o endereço do Aluno');
      String? endereco = stdin.readLineSync();
      pessoaService.altera(email, nome, nascimento, endereco, null);
    } else {
      print('Cadastro não encontrado');
    }

    // email - nome - nascimento - endereco
  }

  void excluirAluno() {
    print('Informe o email do Aluno');
    String email = stdin.readLineSync()!;
    bool verificaExiste = pessoaService.cadastroExiste(email);
    Pessoa? isProfessor = pessoaService.busca(email, null);
    if (verificaExiste && isProfessor is Aluno) {
      pessoaService.excluir(email);
    }
  }

  void listarAluno() {
    pessoaService.listar(true);
  }

  void criarProfessor() {
    print('Informe o email do Professor');
    String email = stdin.readLineSync()!;
    bool verificaExiste = pessoaService.cadastroExiste(email);
    if (!verificaExiste) {
      print('Informe o nome do Professor');
      String nome = stdin.readLineSync()!;
      print('Informe o nascimento do Professor no formato 00/00/0000');
      DateTime? nascimento = df.parse(stdin.readLineSync()!);
      print('Informe o endereço do Professor');
      String endereco = stdin.readLineSync()!;
      print('Informe o salário do Professor');
      double salario = double.parse(stdin.readLineSync()!);
      Pessoa professor = Professor(
          nome: nome, email: email, nascimento: nascimento, salario: salario);
      pessoaService.adiciona(professor);
    } else {
      print('Cadastro já existe');
    }
  }

  void alterarProfessor() {
    print('Informe o email do Professor');
    String email = stdin.readLineSync()!;
    bool verificaExiste = pessoaService.cadastroExiste(email);
    Pessoa? isProfessor = pessoaService.busca(email, null);
    if (verificaExiste && isProfessor is Professor) {
      print('Informe o nome do Professor');
      String? nome = stdin.readLineSync();
      print('Informe o nascimento do Professor no formato 00/00/0000');
      DateTime? nascimento = df.parse(stdin.readLineSync()!);
      print('Informe o endereço do Professor');
      String? endereco = stdin.readLineSync();
      print('Informe o salário do Professor');
      double? salario = double.tryParse(stdin.readLineSync()!);
      pessoaService.altera(email, nome, nascimento, endereco, salario);
    } else {
      print('Cadastro não encontrado');
    }
  }

  void excluirProfessor() {
    print('Informe o email do Professor');
    String email = stdin.readLineSync()!;
    bool verificaExiste = pessoaService.cadastroExiste(email);
    Pessoa? isProfessor = pessoaService.busca(email, null);
    if (verificaExiste && isProfessor is Professor) {
      pessoaService.excluir(email);
    }
  }

  void listarProfessor() {
    pessoaService.listar(false);
  }

  void criarCurso() {
    print('Informe o nome do Curso');
    String nome = stdin.readLineSync()!;
    print('Informe o total de alunos do Curso');
    int? totalAlunos = int.tryParse(stdin.readLineSync()!);
    
  }

  void alterarCurso() {
    cursoService.mostraCodigos();
    print('Informe o código do curso para alterar');
    int? codigo = int.tryParse(stdin.readLineSync()!);
    if(codigo != null? cursoService.cursoExiste(codigo) : false){
      print('Informe o nome do Curso');
      String? nome = stdin.readLineSync();
      print('Informe o total de alunos do Curso');
      int? totalAlunos = int.tryParse(stdin.readLineSync()!);
      cursoService.altera(codigo, nome, totalAlunos);
    }else{
      print('Curso não encontrado');
    }
  }

  void excluirCurso() {
    cursoService.mostraCodigos();
    print('Informe o código do Curso');
    int? codigoCurso = int.tryParse(stdin.readLineSync()!);

  }

  void listarCurso() {}
}

// criarAluno, alterar, excluir, listar
