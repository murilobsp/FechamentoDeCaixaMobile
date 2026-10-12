class NovoFechamentoModel {
  final double dinheiro;
  final double credito;
  final double debito;
  final double pix;


  NovoFechamentoModel({
    required this.dinheiro,
    required this.credito,
    required this.debito,
    required this.pix,
    
  });

  double get total {
    return dinheiro + credito + debito + pix;
  }
}
