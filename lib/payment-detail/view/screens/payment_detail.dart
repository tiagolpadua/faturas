import 'package:faturas/payment-detail/model/payment_detail_model.dart';
import 'package:faturas/payment-detail/view_model/payment_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var nf = NumberFormat.simpleCurrency(locale: 'pt_BR');

class PaymentDetailScreen extends StatefulWidget {
  PaymentDetailViewModel paymentDetailViewModel = PaymentDetailViewModel();

  @override
  _PaymentDetailScreenState createState() => _PaymentDetailScreenState();
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen> {
  @override
  Widget build(BuildContext context) {
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
                    itemCount:
                        widget.paymentDetailViewModel.paymentOptions.length,
                    itemBuilder: (context, indice) {
                      final parcela =
                          widget.paymentDetailViewModel.paymentOptions[indice];
                      return PaymentDetailTile(parcela,
                          widget.paymentDetailViewModel.paymentSelected,
                          (value) {
                        setState(() {
                          widget.paymentDetailViewModel.paymentSelected = value;
                        });
                      });
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
                            Text(
                                "${nf.format(widget.paymentDetailViewModel.invoiceValue)}",
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
                            Text(
                                "${nf.format((widget.paymentDetailViewModel.paymentSelected.number * widget.paymentDetailViewModel.paymentSelected.value) - widget.paymentDetailViewModel.invoiceValue)}",
                                key: Key("tax"),
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16)),
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
        )));
  }
}

class PaymentDetailTile extends StatelessWidget {
  final PaymentDetailModel _payment;
  final Function(PaymentDetailModel) _onChangedFunction;
  final PaymentDetailModel _selectedPayment;

  PaymentDetailTile(
      this._payment, this._selectedPayment, this._onChangedFunction);

  @override
  Widget build(BuildContext context) {
    var key = Key('rlt_${_payment.number}');

    return Card(
        child: RadioListTile<PaymentDetailModel>(
      title: Row(
        children: [
          Text('${_payment.number} x ${nf.format(_payment.value)}', key: key),
          Spacer(),
          Text('${nf.format(_payment.totalValue)}'),
        ],
      ),
      value: _payment,
      groupValue: _selectedPayment,
      onChanged: (PaymentDetailModel? value) {
        _onChangedFunction(value!);
      },
    ));
  }
}
