import 'package:flutter/material.dart';
import 'package:okra_mobile/models/diagnosa.dart';
import 'package:okra_mobile/models/list_gejala.dart';

class DiagnosaProvider with ChangeNotifier {
  Map<String, ModelProviderGejala> _items = {};

  Map<String, ModelProviderGejala> get items => _items;

  void addDiagnosa(String gejalaId, String selectedValue) {
    _items.putIfAbsent(
      gejalaId,
      () => ModelProviderGejala(kodeGejala: gejalaId, kodeValue: selectedValue),
    );
    print(_items);
    notifyListeners();
  }
}
