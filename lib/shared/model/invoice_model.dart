import 'package:flutter/cupertino.dart';

class InvoiceModel extends ChangeNotifier {
  double _value = 4775.0;

  double get value {
    return _value;
  }
}
