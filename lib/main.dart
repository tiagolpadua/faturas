import 'package:faturas/payment-options/view/screens/payment_options.dart';
import 'package:faturas/shared/model/invoice_model.dart';
import 'package:faturas/shared/model/payment_option/selected_payment_option_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<SelectedPaymentOptionModel>(
        create: (_) => SelectedPaymentOptionModel()),
    ChangeNotifierProvider<InvoiceModel>(create: (_) => InvoiceModel()),
  ], child: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Faturas(),
    );
  }
}

showNotImplementedDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Erro"),
    content: Text("Não implementado..."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class Faturas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de Faturas'),
      ),
      body: Container(
        // color: Color(0xFFE7004C),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                      child: Text("Última fatura",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("R\$ 3.025,49",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 8),
                              child: Text("Vencimento 08/07/2019",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black.withOpacity(0.6))),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text("Vencida",
                            style: TextStyle(fontSize: 18, color: Colors.red))
                      ],
                    ),
                    Divider(color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Text("Formas de Pagamento",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Text("Boleto Bancário",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.6))),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('Copiar código de barras do boleto'),
                        ),
                        onPressed: () {
                          showNotImplementedDialog(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('Enviar boleto por e-mail'),
                        ),
                        onPressed: () {
                          showNotImplementedDialog(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Text("Cartão de Crédito",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.6))),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('Pagar com cartão de crédito'),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PaymentOptionsScreen();
                          }));
                        },
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
