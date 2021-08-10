import 'package:faturas/model/installment.dart';
import 'package:faturas/payment-detail/model/installment_options_model.dart';
import 'package:flutter/cupertino.dart';

class InstallmentModel extends ChangeNotifier {
  Installment? _selectedInstallment;

  InstallmentModel() {
    _selectedInstallment = InstallmentOptionsModel().installmentOptions[0];
  }

  Installment? get selectedInstallment {
    return _selectedInstallment;
  }

  set selectedInstallment(Installment? installment) {
    _selectedInstallment = installment;
    notifyListeners();
  }
}
