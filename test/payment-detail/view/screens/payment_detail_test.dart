import 'package:faturas/payment-options/model/payment_options_model.dart';
import 'package:faturas/payment-options/view/screens/payment_options.dart';
import 'package:faturas/payment-options/view_model/payment_options.dart';
import 'package:faturas/shared/model/payment_option/selected_payment_option_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('PaymentDetailScreen', () {
    testWidgets('Screen is rendered', (WidgetTester tester) async {
      Widget testWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider<SelectedPaymentOptionModel>(
                  create: (_) => SelectedPaymentOptionModel()),
              ChangeNotifierProvider<PaymentOptionsModel>(
                  create: (_) => PaymentOptionsModel()),
              ProxyProvider2<SelectedPaymentOptionModel, PaymentOptionsModel,
                  PaymentOptionsViewModel>(
                create: (context) => PaymentOptionsViewModel(
                    selectedPaymentOptionModel:
                        context.read<SelectedPaymentOptionModel>(),
                    paymentOptionsModel: context.read<PaymentOptionsModel>()),
                update: (context, selectedPaymentOptionModel,
                        paymentOptionsModel, notifier) =>
                    PaymentOptionsViewModel(
                  selectedPaymentOptionModel: selectedPaymentOptionModel,
                  paymentOptionsModel: paymentOptionsModel,
                ),
              ),
            ],
            child: PaymentOptionsWidget(),
          ),
        ),
      );

      await tester.pumpWidget(testWidget);

      await tester.pumpAndSettle();

      expect(find.text('Escolha o número de parcelas:'), findsOneWidget);
    });

    testWidgets('User can select othen payment', (WidgetTester tester) async {
      Widget testWidget = MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider<SelectedPaymentOptionModel>(
                  create: (_) => SelectedPaymentOptionModel()),
              ChangeNotifierProvider<PaymentOptionsModel>(
                  create: (_) => PaymentOptionsModel()),
              ProxyProvider2<SelectedPaymentOptionModel, PaymentOptionsModel,
                  PaymentOptionsViewModel>(
                create: (context) => PaymentOptionsViewModel(
                    selectedPaymentOptionModel:
                        context.read<SelectedPaymentOptionModel>(),
                    paymentOptionsModel: context.read<PaymentOptionsModel>()),
                update: (context, selectedPaymentOptionModel,
                        paymentOptionsModel, notifier) =>
                    PaymentOptionsViewModel(
                  selectedPaymentOptionModel: selectedPaymentOptionModel,
                  paymentOptionsModel: paymentOptionsModel,
                ),
              ),
            ],
            child: PaymentOptionsWidget(),
          ),
        ),
      );

      await tester.pumpWidget(testWidget);

      await tester.tap(find.byKey(Key('rlt_5')));

      await tester.pumpAndSettle();

      expect(find.byKey(Key("tax")).toString().contains("284,51"), true);
    });
  });
}
