import 'package:faturas/confirmation/view_model/confirmation.dart';
import 'package:faturas/shared/model/credit_card/user_credit_card_model.dart';
import 'package:faturas/shared/model/payment_option/selected_payment_option_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ProxyProvider2<SelectedPaymentOptionModel, UserCreditCardModel,
          ConfirmationViewModel>(
        create: (context) => ConfirmationViewModel(
            selectedPaymentOptionModel:
                context.read<SelectedPaymentOptionModel>(),
            userCreditCardModel: context.read<UserCreditCardModel>()),
        update: (context, selectedPaymentOptionModel, userCreditCardModel,
                notifier) =>
            ConfirmationViewModel(
          selectedPaymentOptionModel: selectedPaymentOptionModel,
          userCreditCardModel: userCreditCardModel,
        ),
      ),
    ], child: ConfirmationWidget());
  }
}

class ConfirmationWidget extends StatefulWidget {
  @override
  _ConfirmationWidgetState createState() => _ConfirmationWidgetState();
}

class _ConfirmationWidgetState extends State<ConfirmationWidget> {
  @override
  Widget build(BuildContext context) {
    final selectedPaymentOption = context.select(
      (ConfirmationViewModel model) => model.selectedPaymentOption,
    );

    // final userCreditCard = context.select(
    //   (ConfirmationViewModel model) => model.userCreditCard,
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamento da fatura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Revise os valores",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Fatura de junho",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16)),
                          Spacer(),
                          Text("${selectedPaymentOption?.total}",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Taxa de operação",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16)),
                          Spacer(),
                          Text("xxx",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Total", style: TextStyle(fontSize: 16)),
                          Spacer(),
                          Text("xxx", style: TextStyle(fontSize: 16))
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Você vai pagar",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Spacer(),
                          Text("xxx",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                    "Este pagamento é referente somente ao mês de junho. Não vamos salvar os dados do seu cartão para pagamentos recorrentes.",
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
              ),
            ),
            Spacer(),
            Row(
              children: [
                OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Voltar")),
                Spacer(),
                Text("3 de 3"),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      debugPrint("Pagar!");
                    },
                    child: Text("Pagar Fatura"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
