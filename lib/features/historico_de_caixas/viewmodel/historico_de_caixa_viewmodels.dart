import 'package:cloud_firestore/cloud_firestore.dart';

class HistoricoDeCaixaViewmodels {
  Future<List<Map<String, dynamic>>> buscarFechamentos() async {
    final resultado = await FirebaseFirestore.instance
        .collection("fechamentos")
        .orderBy("Date", descending: true)
        .get();

    List<Map<String, dynamic>> dados = resultado.docs.map((documento) {
      return {"id": documento.id, ...documento.data()};
    }).toList();
    return dados;
  }

  //Busca pelo periodo
  Future<List<Map<String, dynamic>>> buscaPeriodo(
    DateTime dataInicial,
    DateTime dataFinal,
  ) async {
    final inicio = DateTime(
      dataInicial.year,
      dataInicial.month,
      dataInicial.day,
    );

    final fim = DateTime(dataFinal.year, dataFinal.month, dataFinal.day + 1);

    final resultado = await FirebaseFirestore.instance
        .collection("fechamentos")
        .where("Date", isGreaterThanOrEqualTo: Timestamp.fromDate(inicio))
        .where("Date", isLessThanOrEqualTo: Timestamp.fromDate(fim))
        .get();

    return resultado.docs.map((doc) => doc.data()).toList();
  }

  //BUSCA TODOS QUE ESTAO FECHADOS
  Future<List<Map<String, dynamic>>> buscarFechados() async {
    final resultado = await FirebaseFirestore.instance
        .collection("fechamentos")
        .where("status", isEqualTo: "Fechado")
        .orderBy("Date", descending: false)
        .get();

    return resultado.docs.map((doc) => doc.data()).toList();
  }

  //BUSCA PELO MES ATUAL
  Future<List<Map<String, dynamic>>> buscaporMes(DateTime data) async {
    final inicio = DateTime(data.year, data.month, 1);
    final fim = DateTime(data.year, data.month + 1, 1);

    final resultado = await FirebaseFirestore.instance
        .collection("fechamentos")
        .where("Date", isGreaterThanOrEqualTo: Timestamp.fromDate(inicio))
        .where("Date", isLessThanOrEqualTo: Timestamp.fromDate(fim))
        .get();

    return resultado.docs.map((doc) => doc.data()).toList();
  }
}
