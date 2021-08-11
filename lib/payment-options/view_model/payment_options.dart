import 'package:faturas/payment-options/model/payment_options_model.dart';
import 'package:faturas/shared/model/payment_option.dart';
import 'package:faturas/shared/model/selected_payment_option_model.dart';

class PaymentOptionsViewModel {
  final double invoiceValue = 3025.49;

  final SelectedPaymentOptionModel _selectedPaymentOptionModel;
  final PaymentOptionsModel _paymentOptionsModel;

  PaymentOptionsViewModel(
      {required SelectedPaymentOptionModel selectedPaymentOptionModel,
      required PaymentOptionsModel paymentOptionsModel})
      : _selectedPaymentOptionModel = selectedPaymentOptionModel,
        _paymentOptionsModel = paymentOptionsModel;

  List<PaymentOption> get paymentOptions {
    return _paymentOptionsModel.paymentOptions;
  }

  PaymentOption? get selectedPaymentOption {
    return _selectedPaymentOptionModel.selectedPaymentOption;
  }

  set selectedPaymentOption(PaymentOption? paymentOption) {
    _selectedPaymentOptionModel.selectedPaymentOption = paymentOption;
  }
}