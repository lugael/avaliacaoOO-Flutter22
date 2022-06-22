import 'notaAluno.dart';
import 'pessoa.dart';

class Aluno extends Pessoa {
  List<NotaAluno> notas = [];

  Aluno({required String nome, required String email, required DateTime nascimento, String? endereco }) : super (nome: nome, email: email, nascimento: nascimento, endereco: endereco); 
  @override
  String toString() {
    return 'Código: $codigo \nNome:$nome \nEmail:$email \nNascimento:$nascimento \nEndereço:$endereco \nNotas:${notas.toString()}';
  }
}
