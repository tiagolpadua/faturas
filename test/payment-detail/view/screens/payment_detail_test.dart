import 'package:faturas/payment-detail/view/screens/payment_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PaymentDetailScreen', () {
    testWidgets('Screen is rendered', (WidgetTester tester) async {
      Widget testWidget = new MediaQuery(
          data: new MediaQueryData(),
          child: new MaterialApp(home: new PaymentDetailScreen()));

      await tester.pumpWidget(testWidget);

      await tester.pumpAndSettle();

      expect(find.text('Escolha o número de parcelas:'), findsOneWidget);
    });

    testWidgets('User can select othen payment', (WidgetTester tester) async {
      Widget testWidget = MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(home: PaymentDetailScreen()));

      await tester.pumpWidget(testWidget);

      await tester.tap(find.byKey(Key('rlt_5')));

      await tester.pumpAndSettle();

      expect(find.byKey(Key("tax")).toString().contains("284,51"), true);
    });
  });
}
