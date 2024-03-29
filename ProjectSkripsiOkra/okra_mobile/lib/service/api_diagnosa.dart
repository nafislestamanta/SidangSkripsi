import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:okra_mobile/models/hasil_diagnosa.dart';
import 'package:okra_mobile/service/api_url.dart';

class ApiDiagnosa {
  final String apiUrl = "$apiurl/Diagnosa";

  Future<HasilDiagnosa?> createDiagnosa(String jsonjawaban) async {

    try {
      final response = await post(
        Uri.parse(apiUrl),
        body: {'list_jawaban': jsonjawaban},
      );

      if (response.statusCode == 200) {
        final hasil = json.decode(response.body);

        final dataHasil = HasilDiagnosa.fromJson(hasil);

        print(dataHasil.data);
        return dataHasil;
      } else {
        return null;
      }

      // log(response.body);
    } catch (e) {
      // Fluttertoast.showToast(msg: e.toString());
      log(e.toString());
      return null;
    }
  }

  // Future<List<HasilDiagnosa>?> getHasil() async {
  //   try {
  //     Response res = await get(Uri.parse(apiUrl));

  //     if (res.statusCode == 200) {
  //       final body = jsonDecode(res.body);

  //       if (body['status']) {
  //         final response = ListHamaPenyakit.fromJson(body);

  //         return response.data;
  //       } else {
  //         throw "Failed to load cases list";
  //       }
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }
}
