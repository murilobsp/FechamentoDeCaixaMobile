import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fechamento_caixa/features/cadastro/model/cadastro_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroViewmodel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> cadastrarUsuario({
    required String nome,
    required String cpf,
    required String email,
    required String senha,
  }) async {
    
    UserCredential usuario = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: senha,
    );

    String uuid = usuario.user!.uid;

    CadastroModel cadastroModel = CadastroModel(
      uuid: uuid.trim(),
      nome: nome.trim(),
      cpf: cpf.trim(),
      email: email.trim(),
      
    );

    await _firestore
        .collection("usuarios")
        .doc(uuid)
        .set(cadastroModel.toMap());
  }
}
