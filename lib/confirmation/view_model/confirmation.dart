import 'package:faturas/shared/model/credit_card/credit_card.dart';
import 'package:faturas/shared/model/credit_card/user_credit_card_model.dart';
import 'package:faturas/shared/model/payment_option/payment_option.dart';
import 'package:faturas/shared/model/payment_option/selected_payment_option_model.dart';

class ConfirmationViewModel {
  final SelectedPaymentOptionModel _selectedPaymentOptionModel;
  final UserCreditCardModel _userCreditCardModel;

  ConfirmationViewModel(
      {required SelectedPaymentOptionModel selectedPaymentOptionModel,
      required UserCreditCardModel userCreditCardModel})
      : _selectedPaymentOptionModel = selectedPaymentOptionModel,
        _userCreditCardModel = userCreditCardModel;

  PaymentOption? get selectedPaymentOption {
    return _selectedPaymentOptionModel.selectedPaymentOption;
  }

  CreditCard? get userCreditCard {
    return _userCreditCardModel.userCreditCard;
  }
}
