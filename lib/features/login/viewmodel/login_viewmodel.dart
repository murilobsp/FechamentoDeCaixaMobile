import 'package:fechamento_caixa/features/login/model/login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewmodel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> fazerLogin(LoginModel login) async {
    return await _auth.signInWithEmailAndPassword(
      email: login.email.trim(),
      password: login.senha.trim(),
    );
  }

  Future<void> deslogar() async {
    await _auth.signOut();
  }
}
