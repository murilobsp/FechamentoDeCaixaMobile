import 'package:cloud_firestore/cloud_firestore.dart';

class RelatorioCaixaViewmodels {

  Future<List<Map<String, dynamic>>> buscarDados() async {
    final dados = await FirebaseFirestore.instance
        .collection("fechamentos")
        .where("status", isEqualTo: "Aberto")
        .limit(1)
        .get();

    return dados.docs.map((doc) => doc.data()).toList();
  }
}
