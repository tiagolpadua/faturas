import 'package:faturas/main.dart';
import 'package:faturas/payment-options/repository/rest/payment_options_rest_service.dart';
import 'package:faturas/shared/model/payment_option/payment_option.dart';
import 'package:flutter/cupertino.dart';

class PaymentOptionsModel extends ChangeNotifier {
  double _invoiceValue;
  List<PaymentOption>? _paymentOptions;

  PaymentOption? _selectedPaymentOption;

  PaymentOptionsModel() : _invoiceValue = 3025.49;

  Future<List<PaymentOption>> getPaymentOptions() async {
    if (_paymentOptions == null) {
      _paymentOptions =
          await getIt<PaymentOptionsRestService>().fetchPaymentOptions();
      selectedPaymentOption = _paymentOptions?[0];
    }
    return _paymentOptions!;
  }

  double get invoiceValue {
    return _invoiceValue;
  }

  set selectedPaymentOption(PaymentOption? paymentOption) {
    _selectedPaymentOption = paymentOption;
    notifyListeners();
  }

  PaymentOption? get selectedPaymentOption {
    return _selectedPaymentOption;
  }
}
