import 'dart:io';

import '../service/pessoaService.dart';

class pessoaView {
  

  String? opc;
  pessoaView(this.pessoaService);
  void aluno() {
    do {
    print('Digite 1 para Alunos, 2 para Professores, ou 3 para Sair');
    opc = stdin.readLineSync()!;
    switch (opc) {
      case '1':
      criar;
      break;
      case '2':
      break;
      default:
    }
} while (opc == '3');
  }

  void professor() {
  }

  void criar(){
    print('Informe o nome do Aluno');
    stdin.readLineSync()!;
    print('Informe o email do Aluno');
    stdin.readLineSync()!;
    print('Informe o nascimento do Aluno');
    DateTime nascimento =  stdin.readLineSync()!;
    print('Informe o endereço do aluno');
  }

  void alterar(){}
}

// criar, alterar, excluir, listar