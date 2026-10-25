class NovoFechamentoModel {
  final double dinheiro;
  final double credito;
  final double debito;
  final double pix;
  final String? obs;
  final String status;
  final double saldoFinal;
  final double? entradas;
  final double? saidas;

  NovoFechamentoModel({
    required this.dinheiro,
    required this.credito,
    required this.debito,
    required this.pix,
    this.obs,
    required this.status,
    required this.saldoFinal,
    this.entradas,
    this.saidas,
  });

  double get total {
    return dinheiro + credito + debito + pix;
  }
}
