import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fechamento_caixa/features/novo_fechamento/model/novo_fechamento_model.dart';




class NovoFechamentoViewmodel {
 
  Future<void> salvarFechamento(NovoFechamentoModel fechamento) async {
    await FirebaseFirestore.instance.collection("fechamentos").add({
      "Date" : DateTime.now(),
      "dinheiro": fechamento.dinheiro,
      "credito": fechamento.credito,
      "debito": fechamento.debito,
      "pix": fechamento.pix,
      "total": fechamento.total,
      "obs" : fechamento.obs,
    });
  }
}