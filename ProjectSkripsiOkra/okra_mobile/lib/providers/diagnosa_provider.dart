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
    // notifyListeners();
  }

  final Map<String, ModelProviderGejala> _items = {};

  Map<String, ModelProviderGejala> get items => _items;

  void addDiagnosa(String gejalaId, String selectedValue) {
    String value = '${gejalaId}_$selectedValue';

    // merubah listjawaban menjadi string dan cek apakah didalamnya tidak terdapat gejala id
    if (!listJawaban.toString().contains(gejalaId)) {
      //tambah value ke dalam listjawaban
      listJawaban.add(value);
    } else {
      log('sudah ada');
      //setiap item dari list jawaban
      final filtered = listJawaban.map((jawaban) {
        //jika jawaban mengandung gejala id (merubah pilihan jawaban)
        if (jawaban.contains(gejalaId)) {
          // maka rubah pilihan jawaban
          return '${gejalaId}_$selectedValue';
        } else {
          return jawaban;
        }
      }).toList();

      listJawaban.clear();
      // masukkan jawaban terbaru hasil terfilter dari map ke listjawaban
      listJawaban.addAll(filtered);
    }

    notifyListeners();
  }

  clearlist() {
    listJawaban.clear();
    // notifyListeners();
  }
}
