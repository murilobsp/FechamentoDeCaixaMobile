import 'package:cloud_firestore/cloud_firestore.dart';

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
}
