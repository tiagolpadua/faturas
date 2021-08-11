import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditCardDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CreditCardDetailsWidget();
  }
}

class CreditCardDetailsWidget extends StatefulWidget {
  @override
  _CreditCardDetailsWidgetState createState() =>
      _CreditCardDetailsWidgetState();
}

class _CreditCardDetailsWidgetState extends State<CreditCardDetailsWidget> {
  final _formKey = new GlobalKey<FormState>();

  String? _notEmpty(String? text) {
    if (text == null || text.isEmpty) {
      return 'Deve ser preenchido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamento da fatura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Número do Cartão",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                TextFormField(
                  maxLength: 16,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  validator: _notEmpty,
                ),
                Text("Nome do titular do cartão",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: _notEmpty,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Validade",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            validator: _notEmpty,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          "CVV",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormField(
                            maxLength: 3,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            validator: _notEmpty,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Essa transação é 100% segura e com certificados de segurança que garantem a integridade dos seus dados.",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
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
                    Text("2 de 3"),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: Text("Continuar"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
