import 'package:faturas/payment-detail/model/installment_options_model.dart';
import 'package:faturas/shared/model/installment.dart';
import 'package:faturas/shared/model/installment_model.dart';

class PaymentOptionsViewModel {
  final double invoiceValue = 3025.49;

  final InstallmentModel _installmentModel;
  final InstallmentOptionsModel _installmentOptionsModel;

  PaymentOptionsViewModel(
      {required InstallmentModel installmentModel,
      required InstallmentOptionsModel installmentOptionsModel})
      : _installmentModel = installmentModel,
        _installmentOptionsModel = installmentOptionsModel;

  List<Installment> get installmentOptions {
    return _installmentOptionsModel.installmentOptions;
  }

  Installment? get selectedInstallment {
    return _installmentModel.selectedInstallment;
  }

  set selectedInstallment(Installment? installment) {
    _installmentModel.selectedInstallment = installment;
  }
}
