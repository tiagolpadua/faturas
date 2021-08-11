import 'package:faturas/main.dart';
import 'package:faturas/payment-options/repository/rest/payment_options_rest_service.dart';
import 'package:faturas/shared/model/payment_option.dart';
import 'package:flutter/cupertino.dart';

class PaymentOptionsModel extends ChangeNotifier {
  Future<List<PaymentOption>> getPaymentOptions() {
    return getIt<PaymentOptionsRestService>().fetchPaymentOptions();
  }
}
