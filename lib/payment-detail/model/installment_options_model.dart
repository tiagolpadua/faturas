import 'package:faturas/model/installment.dart';
import 'package:flutter/cupertino.dart';

class InstallmentOptionsModel extends ChangeNotifier {
  List<Installment> _installmentOptions = [
    Installment(1, 3180, 3180),
    Installment(2, 1630, 3260),
    Installment(3, 1086.67, 3260),
    Installment(4, 815, 3260),
    Installment(5, 662, 3310),
    Installment(6, 551.67, 3310),
    Installment(7, 472.86, 3310)
  ];

  List<Installment> get installmentOptions {
    return _installmentOptions;
  }
}
