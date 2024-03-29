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
    
    cursoService.pessoaService = pessoaService;
    pessoaService.cursoService = cursoService;
  }

  void show() {
    String? opc;
    do {
      print('\nEscolha: \n1-Alunos \n2-Professores \n3-Cursos \n4-Sair');
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
    try {
      String? opc;
      do {
        print('\nSobre alunos: \n1-cadastrar \n2-alterar \n3-excluir \n4-lista de alunos \n5-voltar');
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
            break;
          default:
            print('Valor invalido');
        }
      } while (opc != '5');
    } catch (e) {
      print(e);
    }
  }

  void professor() {
    try {
      
      String? opc;
      do {
        print('\nSobre professores: \n1-cadastrar \n2-alterar \n3-excluir \n4-lista de professores \n5-voltar');
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
            break;
          default:
            print('Valor invalido');
        }
      } while (opc != '5');
    } catch (e) {
      print(e);
    }
  }

  void curso() {
    try {
      
      String? opc;
      do {
        print('\nSobre cursos: \n1-cadastrar \n2-alterar \n3-excluir \n4-lista de cursos \n5-voltar');
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
            break;
          default:
            print('Valor invalido');
        }
      } while (opc != '5');
    } catch (e) {
      print(e);
    }
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
    pessoaService.buscarCodigo(true);
    print('Informe o código do aluno');
    int codigo = int.parse(stdin.readLineSync()!);
    Pessoa? isAluno = pessoaService.busca(null, codigo);
    if (isAluno != null && isAluno is Aluno) {
      print('Informe o novo email do Aluno');
      String email = stdin.readLineSync()!;
      print('Informe o novo nome do Aluno');
      String? nome = stdin.readLineSync();
      print('Informe o nova nascimento do Aluno no formato 00/00/0000');
      DateTime? nascimento = df.parse(stdin.readLineSync()!);
      print('Informe o novo endereço do Aluno');
      String? endereco = stdin.readLineSync();
      pessoaService.altera(
          isAluno.codigo!, email, nome, nascimento, endereco, null);
    } else {
      print('Cadastro não encontrado');
    }
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
      Pessoa professor = Professor(nome: nome, email: email, nascimento: nascimento, salario: salario, endereco: endereco);
      pessoaService.adiciona(professor);
    } else {
      print('Cadastro já existe');
    }
  }

  void alterarProfessor() {
    pessoaService.buscarCodigo(false);
    print('Informe o código do professor');
    int codigo = int.parse(stdin.readLineSync()!);
    Pessoa? isProfessor = pessoaService.busca(null, codigo);
    if (isProfessor != null && isProfessor is Professor) {
      print('Informe o email do Professor');
      String email = stdin.readLineSync()!;
      print('Informe o nome do Professor');
      String? nome = stdin.readLineSync();
      print('Informe o nascimento do Professor no formato 00/00/0000');
      DateTime? nascimento = df.parse(stdin.readLineSync()!);
      print('Informe o endereço do Professor');
      String? endereco = stdin.readLineSync();
      print('Informe o salário do Professor');
      double? salario = double.tryParse(stdin.readLineSync()!);
      pessoaService.altera(
          isProfessor.codigo!, email, nome, nascimento, endereco, salario);
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
    if (!cursoService.cursoExiste(null, nome)) {
      print('Informe o total de alunos do Curso');
      int totalAlunos = int.parse(stdin.readLineSync()!);
      Curso curso = Curso(nome, totalAlunos);
      cursoService.adiciona(curso);
    } else {
      print('Curso já existe');
    }
  }

  void alterarCurso() {
    cursoService.mostraCodigos();
    print('Informe o código do curso para alterar');
    int codigo = int.parse(stdin.readLineSync()!);
    if (cursoService.cursoExiste(codigo, null)) {
      print('Dejese alterar dados \n1-Curso \n2-Pessoas do curso');
      String opc = stdin.readLineSync()!;
      if(opc == '1'){
        print('Informe o nome do Curso');
        String? nome = stdin.readLineSync();
        print('Informe o total de alunos do Curso');
        int? totalAlunos = int.tryParse(stdin.readLineSync()!);
        cursoService.altera(codigo, nome, totalAlunos);
      }else if(opc == '2'){
        alterarPessoasCurso(codigo);
      }else{
        print('Opção invalida');
      }
    } else {
      print('Curso não encontrado');
    }
  }

  void excluirCurso() {
    cursoService.mostraCodigos();
    print('Informe o código do Curso');
    int? codigoCurso = int.tryParse(stdin.readLineSync()!);
    if (cursoService.cursoExiste(codigoCurso, null)) {
      cursoService.excluir(codigoCurso!);
    } else {
      print('Curso não encontrado');
    }
  }

  void listarCurso() {
    cursoService.listar();
  }

  void alterarPessoasCurso(int codigo) {
    String? opc;
    do {
      print('\nAlterações de pessoas: \n1-Adicionar Professor \n2-Adicionar Aluno \n3-Manipular notas do aluno \n4-Remover Professor \n5-Remover Aluno \n6-Voltar');
      opc = stdin.readLineSync();
      switch (opc) {
        case '1':
          pessoaService.buscarCodigo(false);
          print('Informe o código do professor');
          int codigoP = int.parse(stdin.readLineSync()!);
          cursoService.adicionarPessoa(codigo, codigoP, false);
          break;
        case '2':
          pessoaService.buscarCodigo(true);
          print('Informe o código do aluno');
          int codigoP = int.parse(stdin.readLineSync()!);
          cursoService.adicionarPessoa(codigo, codigoP, true);
          break;
        case '3':
          cursoService.mostraPessoaCurso(codigo);
          print('Informe o código do aluno');
          int codigoP = int.parse(stdin.readLineSync()!);
          notasAluno(codigo, codigoP);
          break;
        case '4':
          pessoaService.buscarCodigo(false);
          int codigoP = int.parse(stdin.readLineSync()!);
          cursoService.removerPessoa(codigo, codigoP);
          break;
        case '5':
          pessoaService.buscarCodigo(true);
          int codigoP = int.parse(stdin.readLineSync()!);
          cursoService.removerPessoa(codigo, codigoP);
          break;
        case '6':
          break;
        default:
          print('Opção invalida');
      }
    } while (opc != '6');
  }

  void notasAluno(int codigo, int codigoP) {
    print('Digite: \n1-Adicionar nota \n2-Alterar nota \n3-Remover notas \n4-Exibir Média');
    String? opcao = stdin.readLineSync();
    switch (opcao) {
      case '1':
        cursoService.adicionaNota(codigo, codigoP);
        break;
      case '2':
        cursoService.alterarNota(codigo, codigoP);
        break;
      case '3':
        cursoService.removeNota(codigo, codigoP);
        break;
      case '4':
        cursoService.exibirMedia(codigo, codigoP);
        break;
      default:
        print('Opção invalida');
    }
  }
}