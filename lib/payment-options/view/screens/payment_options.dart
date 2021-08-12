import 'package:faturas/credit-card-details/view/screen/credit_card_details.dart';
import 'package:faturas/payment-options/model/payment_options_model.dart';
import 'package:faturas/payment-options/view_model/payment_options.dart';
import 'package:faturas/shared/model/payment_option/payment_option.dart';
import 'package:faturas/shared/model/payment_option/selected_payment_option_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

var nf = NumberFormat.simpleCurrency(locale: 'pt_BR');

class PaymentOptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
          update: (context, selectedPaymentOptionModel, paymentOptionsModel,
                  notifier) =>
              PaymentOptionsViewModel(
            selectedPaymentOptionModel: selectedPaymentOptionModel,
            paymentOptionsModel: paymentOptionsModel,
          ),
        ),
      ],
      child: PaymentOptionsWidget(),
    );
  }
}

class PaymentOptionsWidget extends StatefulWidget {
  @override
  _PaymentOptionsWidgetState createState() => _PaymentOptionsWidgetState();
}

class _PaymentOptionsWidgetState extends State<PaymentOptionsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                child: Text(
                  "Escolha o número de parcelas:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<PaymentOption>>(
                    future: context.select(
                      (PaymentOptionsViewModel model) =>
                          model.getPaymentOptions(),
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, indice) {
                              final parcela = snapshot.data![indice];
                              return PaymentDetailTile(parcela);
                            });
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: const CircularProgressIndicator(),
                          ),
                        ],
                      );
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
                                var selectedPaymentOption =
                                    paymentDetailViewModel
                                        .selectedPaymentOption;

                                if (selectedPaymentOption != null) {
                                  text = nf.format(
                                      (selectedPaymentOption.number *
                                              selectedPaymentOption.value) -
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CreditCardDetailsScreen();
                        }));
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
  final PaymentOption _payment;

  PaymentDetailTile(this._payment);

  @override
  Widget build(BuildContext context) {
    var key = Key('rlt_${_payment.number}');

    final paymentDetailViewModel =
        Provider.of<PaymentOptionsViewModel>(context);

    return Card(
        child: RadioListTile<PaymentOption>(
      title: Row(
        children: [
          Text('${_payment.number} x ${nf.format(_payment.value)}', key: key),
          Spacer(),
          Text('${nf.format(_payment.total)}'),
        ],
      ),
      value: _payment,
      groupValue: paymentDetailViewModel.selectedPaymentOption,
      onChanged: (PaymentOption? value) {
        paymentDetailViewModel.selectedPaymentOption = value;
      },
    ));
  }
}
