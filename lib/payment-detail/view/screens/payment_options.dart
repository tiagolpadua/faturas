import 'package:faturas/model/installment.dart';
import 'package:faturas/payment-detail/view_model/payment_options.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

var nf = NumberFormat.simpleCurrency(locale: 'pt_BR');

class PaymentOptionsScreen extends StatefulWidget {
  @override
  _PaymentOptionsScreenState createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    final installmentOptions = context.select(
      (PaymentOptionsViewModel model) => model.installmentOptions,
    );

    final invoiceValue = context.select(
      (PaymentOptionsViewModel model) => model.invoiceValue,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamento da fatura'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Escolha o número de parcelas:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16))),
              Expanded(
                child: ListView.builder(
                    itemCount: installmentOptions.length,
                    itemBuilder: (context, indice) {
                      final parcela = installmentOptions[indice];
                      return PaymentDetailTile(parcela);
                    }),
              ),
              Divider(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            Text("Fatura de junho",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16)),
                            Spacer(),
                            Text("${nf.format(invoiceValue)}",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Row(
                          children: [
                            Text("Taxa da operação",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16)),
                            Spacer(),
                            Consumer<PaymentOptionsViewModel>(
                              builder: (_, paymentDetailViewModel, __) {
                                var text = '';
                                var selectedInstallment =
                                    paymentDetailViewModel.selectedInstallment;

                                if (selectedInstallment != null) {
                                  text = nf.format((selectedInstallment.number *
                                          selectedInstallment.value) -
                                      invoiceValue);
                                }

                                return Text(
                                  text,
                                  key: Key("tax"),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Voltar")),
                  Spacer(),
                  Text("1 de 3"),
                  Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        debugPrint("Continuar...");
                      },
                      child: Text("Continuar"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentDetailTile extends StatelessWidget {
  final Installment _payment;

  PaymentDetailTile(this._payment);

  @override
  Widget build(BuildContext context) {
    var key = Key('rlt_${_payment.number}');

    final paymentDetailViewModel =
        Provider.of<PaymentOptionsViewModel>(context);

    return Card(
        child: RadioListTile<Installment>(
      title: Row(
        children: [
          Text('${_payment.number} x ${nf.format(_payment.value)}', key: key),
          Spacer(),
          Text('${nf.format(_payment.total)}'),
        ],
      ),
      value: _payment,
      groupValue: paymentDetailViewModel.selectedInstallment,
      onChanged: (Installment? value) {
        paymentDetailViewModel.selectedInstallment = value;
      },
    ));
  }
}
