import 'package:faturas/payment-options/model/payment_options_model.dart';
import 'package:faturas/shared/model/payment_option.dart';
import 'package:flutter/cupertino.dart';

class SelectedPaymentOptionModel extends ChangeNotifier {
  PaymentOption? _selectedPaymentOption;

  SelectedPaymentOptionModel() {
    _selectedPaymentOption = PaymentOptionsModel().paymentOptions[0];
  }

  PaymentOption? get selectedPaymentOption {
    return _selectedPaymentOption;
  }

  set selectedPaymentOption(PaymentOption? paymentOption) {
    _selectedPaymentOption = paymentOption;
    notifyListeners();
  }
}
