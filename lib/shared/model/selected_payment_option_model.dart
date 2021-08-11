import 'package:faturas/shared/model/payment_option.dart';
import 'package:flutter/cupertino.dart';

class SelectedPaymentOptionModel extends ChangeNotifier {
  PaymentOption? _selectedPaymentOption;

  PaymentOption? get selectedPaymentOption {
    return _selectedPaymentOption;
  }

  set selectedPaymentOption(PaymentOption? paymentOption) {
    _selectedPaymentOption = paymentOption;
    notifyListeners();
  }
}
