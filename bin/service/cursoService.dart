import 'dart:io';

import '../model/aluno.dart';
import '../model/curso.dart';
import '../model/notaAluno.dart';
import '../model/pessoa.dart';

import '../model/professor.dart';
import '../repository/curso_repository_interface.dart';
import 'pessoaService.dart';

class CursoService {
  ICursoRepository cursoRepository;
  late PessoaService pessoaService;
  CursoService(this.cursoRepository);

  adiciona(Curso curso) {
    cursoRepository.criarCurso(curso);
  }

  altera(int codigo, String? nome, int? qtdPessoas) {
    cursoRepository.alterarCurso(codigo, nome, qtdPessoas, null);
  }

  bool cursoExiste(int? codigo, String? nome) {
    return cursoRepository.cursoExiste(codigo, nome);
  }

  bool existeAluno(Pessoa aluno) {
    return cursoRepository.existeAluno(aluno);
  }

  mostraCodigos() {
    cursoRepository.listarCodigo();
  }

  listar() {
    cursoRepository.listarCurso();
  }

  excluir(int codigo) {
    Curso? curso = cursoRepository.buscaCurso(codigo);
    if (curso!.pessoas.isEmpty) {
      cursoRepository.excluirCurso(curso);
    } else {
      print('Curso possui aluno');
    }
  }

  adicionarPessoa(int codigo, int codigoP, bool isAluno) {
    Curso? curso = cursoRepository.buscaCurso(codigo);
    if (isAluno) {
      int quantidade = 0;
      for (var pessoa in curso!.pessoas) {
        if (pessoa is Aluno) {
          quantidade++;
        }
      }
      if (curso.totalAlunos > quantidade) {
        Pessoa? pessoa = pessoaService.busca(null, codigoP);
        bool contem = curso.pessoas.contains(pessoa);
        if (!contem) {
          curso.pessoas.add(pessoa!);
          cursoRepository.alterarCurso(codigo, null, null, curso.pessoas);
        }else{
          print('Aluno já cadastrada no curso');
        }
      } else {
        print('Curso está cheio');
      }
    } else if(!isAluno) {
      Pessoa? pessoa = pessoaService.busca(null, codigoP);
       bool contem = curso!.pessoas.contains(pessoa);
      if(pessoa is Professor && !contem){
        curso.pessoas.add(pessoa);
        cursoRepository.alterarCurso(codigo, null, null, curso.pessoas);
      }else{
        print('Não foi possivel cadastar, verifique se o cadastro existe ou já não faz parte do curso');
      }
    }
  }

  removerPessoa(int codigo, int codigoP) {
    Pessoa? pessoa = pessoaService.busca(null, codigoP);
    cursoRepository.removePessoa(codigo, pessoa!);
  }

  mostraPessoaCurso(int codigo) {
    Curso? curso = cursoRepository.buscaCurso(codigo);
    for (var pessoa in curso!.pessoas) {
      pessoa is Aluno ? print('Código: ${pessoa.codigo} \nAluno: ${pessoa.nome}') : '';
    }
  }

  adicionaNota(int codigo, int codigoP) {
    Pessoa? pessoa = pessoaService.busca(null, codigoP);
    Curso? curso = cursoRepository.buscaCurso(codigo);
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
          if(i != 2){
            print('Deseja adicionar outra nota? digite \n1-Sim \n2-não');
            String opc = stdin.readLineSync()!;
            if (opc == '2') {
              i = 4;
            }
          }
        }
        NotaAluno notasALuno = NotaAluno(notas, curso!);
        pessoaService.adiconaNota(codigoP, notasALuno);
      }
    }
  }

  removeNota(int codigo, int codigoP) {
    Curso? curso = cursoRepository.buscaCurso(codigo);
    pessoaService.removerNota(codigoP, curso!);
  }

  alterarNota(int codigo, int codigoP){
    Curso? curso = cursoRepository.buscaCurso(codigo);
    Pessoa? pessoa = pessoaService.busca(null, codigoP);
    if(pessoa is Aluno){
      NotaAluno nota = pessoa.notas.firstWhere((element) => element.curso == curso);
      for (var i = 0; i < nota.notas.length; i++) {
        print('${i+1}ª nota: ${nota.notas[i]}');
      }
      print('Informe o qual a possição da nota');
      int posicao = int.parse(stdin.readLineSync()!);
      if ((posicao - 1) < nota.notas.length) {
        print('Informe a nova nota');
        double notaNova = double.parse(stdin.readLineSync()!);
        nota.notas[posicao-1] = notaNova;
        pessoaService.alterarNota(nota, codigoP);
      }else{
        print('Posição incorreta');
      }
    }
  }

  exibirMedia(int codigo, int codigoP){
    Curso? curso = cursoRepository.buscaCurso(codigo);
    pessoaService.calcularMedia(curso!, codigoP);
  }
}
