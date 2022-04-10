import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:okra_mobile/models/detail_hamapenyakit.dart';
import 'package:okra_mobile/models/list_gejala.dart';
import 'package:okra_mobile/models/list_hamapenyakit.dart';
import 'package:okra_mobile/service/api_url.dart';

class ApiHamaPenyakit {
  final String apiUrlHama = "$apiurl/HamaPenyakit";
  final String apiUrl = "$apiurl/HamaPenyakit/penyakit";
  final String apiUrlGejala = "$apiurl/HamaPenyakit/gejala";

  Future<List<HamaPenyakit>?> getPenyakit() async {
    try {
      Response res = await get(Uri.parse(apiUrl));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = ListHamaPenyakit.fromJson(body);

          return response.data;
        } else {
          throw "Failed to load cases list";
        }
      }
    } catch (e) {
      throw e.toString();
    }
  }
  
  Future<List<HamaPenyakit>?> getHama() async {
    try {
      Response res = await get(Uri.parse(apiUrlHama));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = ListHamaPenyakit.fromJson(body);

          return response.data;
        } else {
          throw "Failed to load cases list";
        }
      }
    } catch (e) {
      throw e.toString();
    } 
  }

  Future<List<Gejala>?> getGejala() async {
    try {
      Response res = await get(Uri.parse(apiUrlGejala));

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);

        if (body['status']) {
          final response = ListGejala.fromJson(body);

          return response.data;
        } else {
          throw "Failed to load cases list";
        }
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<DetailHamaPenyakit> getPenyakitById(String id) async {
    final response =
        await get(Uri.parse('$apiurl/HamaPenyakit/Penyakit?kode_hp=$id'));

    if (response.statusCode == 200) {
      return DetailHamaPenyakit.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a hamapenyakit');
    }
  }
}
