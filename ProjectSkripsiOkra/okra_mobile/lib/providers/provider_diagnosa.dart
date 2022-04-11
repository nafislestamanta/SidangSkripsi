import 'package:flutter/material.dart';

class ProviderDiagnosa with ChangeNotifier {
  String? _checkValue;

  String get checkValue => _checkValue!;
  set checkValue(String value) {
    _checkValue = value;
    notifyListeners();
  }
}
