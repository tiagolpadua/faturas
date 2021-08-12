import 'package:faturas/shared/model/payment_option/payment_option.dart';
import 'package:flutter/cupertino.dart';

class PaymentOptionsModel extends ChangeNotifier {
  Future<List<PaymentOption>> getPaymentOptions() {
    return Future.delayed(Duration(seconds: 2), () {
      return [
        PaymentOption(1, 3180, 3180),
        PaymentOption(2, 1630, 3260),
        PaymentOption(3, 1086.67, 3260),
        PaymentOption(4, 815, 3260),
        PaymentOption(5, 662, 3310),
      ];
    });
  }
}
