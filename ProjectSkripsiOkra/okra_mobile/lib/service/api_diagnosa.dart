import 'dart:convert';

import 'package:http/http.dart';
import 'package:okra_mobile/models/diagnosa.dart';
import 'package:okra_mobile/providers/diagnosa_provider.dart';
import 'package:okra_mobile/service/api_url.dart';
import 'package:provider/provider.dart';

class ApiDiagnosa {
  final String apiUrl = "$apiurl/HamaPenyakit/Diagnosa";

  Future createDiagnosa(ModelProviderGejala diagnosa) async {
    List<String> listJawaban = [
      "${diagnosa.kodeGejala}_${diagnosa.kodeValue}",
    ];

    try {
      final response = await post(Uri.parse(apiUrl),
          body: jsonEncode({'list_jawaban': listJawaban}));
    } catch (e) {
      // Fluttertoast.showToast(msg: e.toString());
    }
  }
}
