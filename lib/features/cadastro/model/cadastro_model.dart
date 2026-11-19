class CadastroModel {
  final String uuid;
  final String nome;
  final String cpf;
  final String email;
 

  CadastroModel({
    required this.uuid,
    required this.nome,
    required this.cpf,
    required this.email,
    
  });

  Map<String, dynamic> toMap() {
    return {"uuid": uuid, "nome": nome, "cpf": cpf, "email": email};
  }
}
