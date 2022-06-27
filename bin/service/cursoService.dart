import 'dart:io';

import '../model/aluno.dart';
import '../model/curso.dart';
import '../model/notaAluno.dart';
import '../model/pessoa.dart';
import '../repository/cursoRepository.dart';
import 'pessoaService.dart';

class CursoService {
  CursoRepository cursoRepository;
  late PessoaService pessoaService;
  CursoService(this.cursoRepository);

  void adiciona(Curso curso) {
    cursoRepository.criarCurso(curso);
  }

  void altera(int codigo, String? nome, int? qtdPessoas) {
    cursoRepository.alterarCurso(codigo, nome, qtdPessoas, null);
  }

  bool cursoExiste(int? codigo, String? nome) {
    if (codigo != null) {
      return cursoRepository.cursos.any((element) => element.codigo == codigo);
    } else if (nome != null) {
      return cursoRepository.cursos.any((element) => element.nome == nome);
    }
    return false;
  }

  bool existeAluno(Pessoa aluno) {
    return cursoRepository.existeAluno(aluno);
  }

  void mostraCodigos() {
    cursoRepository.listarCodigo();
  }

  void listar() {
    cursoRepository.listarCurso();
  }

  void excluir(int codigo) {
    Curso curso = cursoRepository.cursos
        .firstWhere((element) => element.codigo == codigo);
    if (curso.pessoas.isEmpty) {
      cursoRepository.excluirCurso(curso);
    } else {
      print('Curso possui aluno');
    }
  }

  void adicionarPessoa(int codigo, int codigoP, bool isAluno) {
    Curso curso = cursoRepository.cursos
        .firstWhere((element) => element.codigo == codigo);
    if (isAluno) {
      int quantidade = 0;
      for (var pessoa in curso.pessoas) {
        if (pessoa is Aluno) {
          quantidade++;
        }
      }
      if (curso.totalAlunos < quantidade) {
        Pessoa? pessoa = pessoaService.busca(null, codigoP);
        curso.pessoas.add(pessoa!);
        cursoRepository.alterarCurso(codigo, null, null, curso.pessoas);
      } else {
        print('Curso está cheio');
      }
    } else {
      Pessoa? pessoa = pessoaService.busca(null, codigoP);
      curso.pessoas.add(pessoa!);
      cursoRepository.alterarCurso(codigo, null, null, curso.pessoas);
    }
  }

  void removerPessoa(int codigo, int codigoP) {
    Curso curso = cursoRepository.cursos
        .firstWhere((element) => element.codigo == codigo);
    Pessoa? pessoa = pessoaService.busca(null, codigoP);
    curso.pessoas.removeWhere((element) => element == pessoa);
  }

  void mostraPessoaCurso(int codigo) {
    Curso curso = cursoRepository.cursos
        .firstWhere((element) => element.codigo == codigo);
    for (var pessoa in curso.pessoas) {
      pessoa is Aluno ? print('Código: ${pessoa.codigo} \nAluno: ${pessoa.nome}') : '';
    }
  }

  void adicionaNota(int codigo, int codigoP) {
    Pessoa? pessoa = pessoaService.busca(null, codigoP);
    Curso curso = cursoRepository.cursos
        .firstWhere((element) => element.codigo == codigo);
    if (pessoa is Aluno) {
      bool existeCursoNota = pessoa.notas.contains(curso);
      if (pessoa.notas.isNotEmpty && existeCursoNota) {
        NotaAluno? notasAluno =
            pessoa.notas.firstWhere((element) => element.curso == curso);
        for (int quantidade = notasAluno.notas.length;
            quantidade <= 3;
            quantidade++) {
          print('Informe a ${quantidade + 1} nota');
          double nota = double.parse(stdin.readLineSync()!);
          notasAluno.notas.add(nota);
        }
        pessoaService.adiconaNota(codigoP, notasAluno);
      } else {
        List<double> notas = [];
        for (var i = 0; i < 3; i++) {
          print('Informe a ${i + 1}ª nota');
          double nota = double.parse(stdin.readLineSync()!);
          notas.add(nota);
          print('Deseja adicionar outra nota? digite \n1-Sim \n2-não');
          String opc = stdin.readLineSync()!;
          if (opc == '2') {
            i = 4;
          }
        }
        NotaAluno notasALuno = NotaAluno(notas, curso);
        pessoaService.adiconaNota(codigoP, notasALuno);
      }
    }
  }

  void removeNota(int codigo, int codigoP) {
    Curso curso = cursoRepository.cursos
        .firstWhere((element) => element.codigo == codigo);
    pessoaService.removerNota(codigoP, curso);
  }
}
