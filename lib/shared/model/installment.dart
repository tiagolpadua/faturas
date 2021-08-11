class Installment {
  final int number;
  final double value;
  final double total;

  Installment(this.number, this.value, this.total);

  @override
  String toString() {
    return 'Installment{number: $number, value: $value, total: $total}';
  }
}
