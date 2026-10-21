class NovoFechamentoModel {
  final double dinheiro;
  final double credito;
  final double debito;
  final double pix;
  final String? obs;

  NovoFechamentoModel({
    required this.dinheiro,
    required this.credito,
    required this.debito,
    required this.pix,
    this.obs,
  });

  double get total {
    return dinheiro + credito + debito + pix;
  }
}
