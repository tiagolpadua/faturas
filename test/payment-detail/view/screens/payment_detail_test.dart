import 'package:faturas/payment-detail/model/installment_options_model.dart';
import 'package:faturas/payment-detail/view/screens/payment_options.dart';
import 'package:faturas/payment-detail/view_model/payment_options.dart';
import 'package:faturas/shared/model/installment_model.dart';
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
              ChangeNotifierProvider<InstallmentModel>(
                  create: (_) => InstallmentModel()),
              ChangeNotifierProvider<InstallmentOptionsModel>(
                  create: (_) => InstallmentOptionsModel()),
              ProxyProvider2<InstallmentModel, InstallmentOptionsModel,
                  PaymentOptionsViewModel>(
                create: (context) => PaymentOptionsViewModel(
                    installmentModel: context.read<InstallmentModel>(),
                    installmentOptionsModel:
                        context.read<InstallmentOptionsModel>()),
                update: (context, installmentModel, installmentOptionsModel,
                        notifier) =>
                    PaymentOptionsViewModel(
                  installmentModel: installmentModel,
                  installmentOptionsModel: installmentOptionsModel,
                ),
              ),
            ],
            child: PaymentOptionsScreen(),
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
              ChangeNotifierProvider<InstallmentModel>(
                  create: (_) => InstallmentModel()),
              ChangeNotifierProvider<InstallmentOptionsModel>(
                  create: (_) => InstallmentOptionsModel()),
              ProxyProvider2<InstallmentModel, InstallmentOptionsModel,
                  PaymentOptionsViewModel>(
                create: (context) => PaymentOptionsViewModel(
                    installmentModel: context.read<InstallmentModel>(),
                    installmentOptionsModel:
                        context.read<InstallmentOptionsModel>()),
                update: (context, installmentModel, installmentOptionsModel,
                        notifier) =>
                    PaymentOptionsViewModel(
                  installmentModel: installmentModel,
                  installmentOptionsModel: installmentOptionsModel,
                ),
              ),
            ],
            child: PaymentOptionsScreen(),
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
