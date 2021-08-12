import 'package:flutter/cupertino.dart';

class InvoiceModel extends ChangeNotifier {
  double _value = 3180.0;

  double get value {
    return _value;
  }
}
