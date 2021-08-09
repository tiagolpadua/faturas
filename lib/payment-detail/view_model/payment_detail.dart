import 'package:faturas/payment-detail/model/payment_detail_model.dart';

class PaymentDetailViewModel {
  final double invoiceValue = 3025.49;

  final List<PaymentDetailModel> paymentOptions = [
    PaymentDetailModel(1, 3180, 3180),
    PaymentDetailModel(2, 1630, 3260),
    PaymentDetailModel(3, 1086.67, 3260),
    PaymentDetailModel(4, 815, 3260),
    PaymentDetailModel(5, 662, 3310),
    PaymentDetailModel(6, 551.67, 3310),
    PaymentDetailModel(7, 472.86, 3310),
  ];

  late PaymentDetailModel paymentSelected;

  PaymentDetailViewModel() {
    paymentSelected = paymentOptions[0];
  }
}
