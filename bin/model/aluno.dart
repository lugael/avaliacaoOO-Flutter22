import 'package:intl/intl.dart';

import 'notaAluno.dart';
import 'pessoa.dart';
DateFormat df = DateFormat('dd/MM/yyyy');
class Aluno extends Pessoa {
  List<NotaAluno> notas = [];

  Aluno({required String nome, required String email, required DateTime nascimento, String? endereco }) : super (nome: nome, email: email, nascimento: nascimento, endereco: endereco); 
  @override
  String toString() {
    String nota = '';
    for (var item in notas) {
      nota += '\nCurso: ${item.curso.nome} Notas: ${item.notas}';
    }

    return 'Código: $codigo \nNome:$nome \nEmail:$email \nNascimento:${df.format(nascimento)} \nEndereço:$endereco \nNotas:${nota != '' ? nota : 'Sem notas'}';
  }
}
