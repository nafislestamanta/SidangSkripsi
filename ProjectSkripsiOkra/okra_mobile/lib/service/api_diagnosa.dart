import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:okra_mobile/models/hasil_diagnosa.dart';
import 'package:okra_mobile/service/api_url.dart';

class ApiDiagnosa {
  final String apiUrl = "$apiurl/Diagnosa";

  Future createDiagnosa(String jsonjawaban) async {
    // List<String> listJawaban = [
    //   "${diagnosa.kodeGejala}_${diagnosa.kodeValue}",
    // ];

    try {
      final response = await post(
        Uri.parse(apiUrl),
        body: {'list_jawaban': jsonjawaban},
      );

      // print(response.body);

      if (response.statusCode == 200) {
        final hasil = json.decode(response.body);
        // print(hasil);

        final dataHasil = HasilDiagnosa.fromJson(hasil);

        print(dataHasil.data);
      } else {
        print("error ya");
      }

      // log(response.body);
    } catch (e) {
      // Fluttertoast.showToast(msg: e.toString());
      log(e.toString());
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
