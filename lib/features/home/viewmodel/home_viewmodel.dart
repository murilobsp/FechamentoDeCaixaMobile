import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeViewmodel {
  Future<double> buscarInicio() async {
    final resultado = await FirebaseFirestore.instance
        .collection("fechamentos")
        .where("status", isEqualTo: "Aberto")
        .limit(1)
        .get();

    if (resultado.docs.isNotEmpty) {
      final dados = resultado.docs.first.data();

      return (dados["inicioCaixa"] as num).toDouble();
    }
    return 0;
  }

  Future<Map<String, dynamic>> buscarUser() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("Usuário não encontrado.");
    }

    final resultado = await FirebaseFirestore.instance
        .collection("usuarios")
        .doc(user.uid)
        .get();

    return resultado.data()!;
  }
}
