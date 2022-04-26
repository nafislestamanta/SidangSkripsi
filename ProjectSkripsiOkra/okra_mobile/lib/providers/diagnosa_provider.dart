import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:okra_mobile/models/diagnosa.dart';
import 'package:okra_mobile/models/hasil_diagnosa.dart';

class DiagnosaProvider with ChangeNotifier {
  List<String> listJawaban = [];

  HasilDiagnosa? hasil;

  saveHasil(HasilDiagnosa hasilValue) {
    hasil = hasilValue;
    notifyListeners();
  }

  resetHasil() {
    hasil = null;
    notifyListeners();
  }

  final Map<String, ModelProviderGejala> _items = {};

  Map<String, ModelProviderGejala> get items => _items;

  void addDiagnosa(String gejalaId, String selectedValue) {
    // _items.putIfAbsent(
    //   gejalaId,
    //   () => ModelProviderGejala(kodeGejala: gejalaId, kodeValue: selectedValue),
    // );
    // print(_items);
    String value = '${gejalaId}_$selectedValue';

    if (!listJawaban.toString().contains(gejalaId)) {
      listJawaban.add(value);
    } else {
      log('sudah ada');
      final filtered = listJawaban.map((jawaban) {
        if (jawaban.contains(gejalaId)) {
          return '${gejalaId}_$selectedValue';
        } else {
          return jawaban;
        }
      }).toList();

      listJawaban.clear();
      listJawaban.addAll(filtered);
    }

    notifyListeners();
  }

  clearlist() {
    listJawaban.clear();
    // notifyListeners();
  }
}
