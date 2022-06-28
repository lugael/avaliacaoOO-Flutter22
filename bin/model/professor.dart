import 'package:intl/intl.dart';

import 'pessoa.dart';
DateFormat df = DateFormat('dd/MM/yyyy');
class Professor extends Pessoa{
  double? salario;

  Professor({required String nome, required String email, required DateTime nascimento, String? endereco, required this.salario }) : super (nome: nome, email: email, nascimento: nascimento, endereco: endereco); 
  
  @override
  String toString() {
    return 'Código: $codigo \nNome:$nome \nEmail:$email \nNascimento:${df.format(nascimento)} \nEndereço:$endereco \nSalário:$salario';
  }
}
