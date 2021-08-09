class Parcela {
  final int qtd;
  final double valorParcela;
  final double valorTotal;

  Parcela(this.qtd, this.valorParcela, this.valorTotal);

  @override
  String toString() {
    return 'Parcela{qtd: $qtd, valorParcela: $valorParcela, valorTotal: $valorTotal}';
  }
}
