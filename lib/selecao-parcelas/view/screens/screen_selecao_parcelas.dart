import 'package:faturas/selecao-parcelas/model/Parcela.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var nf = NumberFormat.simpleCurrency(locale: 'pt_BR');

class SelecaoParcelasScreen extends StatefulWidget {
  final double _valorFatura = 3025.49;
  int _qtdSelecionado = -1;

  final List<Parcela> _parcelas = [
    Parcela(1, 3180, 3180),
    Parcela(2, 1630, 3260),
    Parcela(3, 1086.67, 3260),
    Parcela(4, 815, 3260),
    Parcela(5, 662, 3310),
    Parcela(6, 551.67, 3310),
    Parcela(7, 472.86, 3310),
  ];

  final double _taxaOperacao = 154.51;

  @override
  _SelecaoParcelasScreenState createState() => _SelecaoParcelasScreenState();
}

class _SelecaoParcelasScreenState extends State<SelecaoParcelasScreen> {
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
                    itemCount: widget._parcelas.length,
                    itemBuilder: (context, indice) {
                      final transferencia = widget._parcelas[indice];
                      return ItemParcela(transferencia, (value) {
                        setState(() {
                          debugPrint(widget._qtdSelecionado.toString());
                          widget._qtdSelecionado = value;
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
                            Text("${nf.format(widget._valorFatura)}",
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
                            Text("${nf.format(widget._taxaOperacao)}",
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

class ItemParcela extends StatelessWidget {
  final Parcela _parcela;
  final Function(int) _onChangedFunction;

  ItemParcela(this._parcela, this._onChangedFunction);

  @override
  Widget build(BuildContext context) {
    int val = -1;
    String qtd = _parcela.qtd.toString();
    return Card(
      child: ListTile(
        // leading: Icon(Icons.monetization_on),
        leading: Radio(
          groupValue: val,
          value: _parcela.qtd,
          onChanged: (int? x) {
            _onChangedFunction(x = 0);
          },
        ),
        title: Row(
          children: [
            // Text('$qtd x R\$ $valorParcela'),
            Text('$qtd x ${nf.format(_parcela.valorParcela)}'),
            Spacer(),
            Text('${nf.format(_parcela.valorTotal)}')
          ],
        ),
      ),
    );
  }
}
