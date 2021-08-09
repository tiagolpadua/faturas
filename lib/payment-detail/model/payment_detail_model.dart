class PaymentDetailModel {
  final int number;
  final double value;
  final double totalValue;

  PaymentDetailModel(this.number, this.value, this.totalValue);

  @override
  String toString() {
    return 'PaymentDetailModel{number: $number, value: $value, totalValue: $totalValue}';
  }
}
