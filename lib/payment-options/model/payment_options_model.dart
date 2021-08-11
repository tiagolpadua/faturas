import 'package:faturas/shared/model/payment_option.dart';
import 'package:flutter/cupertino.dart';

class PaymentOptionsModel extends ChangeNotifier {
  List<PaymentOption> _paymentOptions = [
    PaymentOption(1, 3180, 3180),
    PaymentOption(2, 1630, 3260),
    PaymentOption(3, 1086.67, 3260),
    PaymentOption(4, 815, 3260),
    PaymentOption(5, 662, 3310),
    PaymentOption(6, 551.67, 3310),
    PaymentOption(7, 472.86, 3310)
  ];

  List<PaymentOption> get paymentOptions {
    return _paymentOptions;
  }
}
