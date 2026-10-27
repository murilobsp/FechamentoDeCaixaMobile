import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fechamento_caixa/features/novo_fechamento/model/novo_fechamento_model.dart';

class NovoFechamentoViewmodel {
  Future<void> salvarFechamento(NovoFechamentoModel fechamento) async {
    await FirebaseFirestore.instance.collection("fechamentos").add({
      "dinheiro": 0,
      "credito": 0,
      "debito": 0,
      "pix": 0,
      "total": 0,
      "obs": "",
      "inicioCaixa": fechamento.saldoFinal,
      "status": "Aberto",
    });
  }

  Future<String?> buscarCaixaAberto() async {
    final resultado = await FirebaseFirestore.instance
        .collection("fechamentos")
        .where("status", isEqualTo: "Aberto")
        .limit(1)
        .get();

    if (resultado.docs.isEmpty) return null;

    return resultado.docs.first.id;
  }

  Future<double?> buscarInicio() async {
    final resultado = await FirebaseFirestore.instance
        .collection("fechamentos")
        .where("status", isEqualTo: "Aberto")
        .limit(1)
        .get();

    if (resultado.docs.isEmpty) return null;

    final resul = resultado.docs.first.data();

    return (resul["inicioCaixa"] as num).toDouble();
  }

  Future<void> finalizarFechamento(
    NovoFechamentoModel fechamento,
    String? idCaixa,
  ) async {
    await FirebaseFirestore.instance
        .collection("fechamentos")
        .doc(idCaixa)
        .update({
          "Date": DateTime.now(),
          "dinheiro": fechamento.dinheiro,
          "credito": fechamento.credito,
          "debito": fechamento.debito,
          "pix": fechamento.pix,
          "total": fechamento.total,
          "obs": fechamento.obs,
          "saldoFinalEmCaixa": fechamento.saldoFinal,
          "status": "Fechado",
          "entradas": fechamento.entradas ?? 0,
          "saidas": fechamento.saidas ?? 0,
        });
  }

  



  
}
