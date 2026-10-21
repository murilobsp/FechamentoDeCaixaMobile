import 'package:cloud_firestore/cloud_firestore.dart';

class HistoricoDeCaixaViewmodels {

  Future<List<Map<String, dynamic>>> buscarFechamentos() async {
  final resultado = await FirebaseFirestore.instance
      .collection("fechamentos")
      .orderBy("Date", descending: true)
      .get();

  List<Map<String, dynamic>> dados = resultado.docs.map((documento) {
    return {"id": documento.id,
     ...documento.data()};
  }).toList();
  return dados;
}
}