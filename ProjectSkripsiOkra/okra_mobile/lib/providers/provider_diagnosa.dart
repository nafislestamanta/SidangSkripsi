import 'package:flutter/material.dart';
import 'package:okra_mobile/models/list_gejala.dart';
import 'package:okra_mobile/models/models_provider_gejala.dart';

class ProviderDiagnosa with ChangeNotifier {
  // String? _checkValue;
  final List<ModelProviderGejala> _items = [];

  void add(ModelProviderGejala item) {
    _items.add(item);
    notifyListeners();
    print(_items);
  }

  // String get checkValue => _checkValue!;
  // set checkValue(String value) {
  //   _checkValue = value;
  //   notifyListeners();
  // }
}
